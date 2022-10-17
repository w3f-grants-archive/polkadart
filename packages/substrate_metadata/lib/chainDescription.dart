// ignore_for_file: file_names, no_leading_underscores_for_local_identifiers

import 'dart:typed_data';

import 'package:cached_annotation/cached_annotation.dart';
import 'package:polkadart_scale_codec/polkadart_scale_codec.dart'
    as scale_codec;
import 'package:substrate_metadata/exceptions/unexpected_exception.dart';
import 'package:substrate_metadata/old/legacy_types.dart';
import 'package:substrate_metadata/utils/common_utils.dart';

import 'models/models.dart';
import 'storage.dart';

part 'chainDescription.cached.dart';

class ChainDescription {
  final List<scale_codec.Type> types;
  final int call;
  final int digest;
  final int digestItem;
  final int event;
  final int eventRecord;
  final int eventRecordList;
  final int signature;
  final Map<String, Map<String, StorageItem>> storage;
  final Map<String, Map<String, Constant>> constants;

  const ChainDescription({
    required this.types,
    required this.call,
    required this.digest,
    required this.digestItem,
    required this.event,
    required this.eventRecord,
    required this.eventRecordList,
    required this.signature,
    required this.storage,
    required this.constants,
  });
}

class Constant {
  final int type;
  final Uint8List value;
  final List<String> docs;
  const Constant({required this.type, required this.value, required this.docs});
}

ChainDescription getChainDescriptionFromMetadata(
    Metadata metadata, LegacyTypes? legacyTypes) {
  switch (metadata.kind) {
    case 'V9':
    case 'V10':
    case 'V11':
    case 'V12':
    case 'V13':
      assertNotNull(legacyTypes,
          'scale_codec.Type definitions are required for metadata ${metadata.kind}');
      return FromOld(metadata, legacyTypes!).convert();
    case 'V14':
      return FromV14((metadata as Metadata_V14).value).convert();
    default:
      throw Exception('Unsupported metadata version: ${metadata.kind}');
  }
}

@WithCache()
abstract class FromV14 implements _$FromV14 {
  factory FromV14(MetadataV14 _metadata) = _FromV14;

  ChainDescription convert() {
    return ChainDescription(
        types: _types(),
        call: _call(),
        digest: _digest(),
        digestItem: _digestItem(),
        event: _event(),
        eventRecord: _eventRecord(),
        eventRecordList: _eventRecordList(),
        signature: _signature(),
        storage: _storage(),
        constants: _constants());
  }

  @Cached()
  int _digest() {
    return _getStorageItem('System', 'Digest').value;
  }

  @Cached()
  int _digestItem() {
    var digest = _types()[_digest()];
    assertionCheck(digest.kind == scale_codec.TypeKind.Composite);
    for (var field in (digest as scale_codec.CompositeType).fields) {
      if (field.name == 'logs') {
        var seq = _types()[field.type];
        assertionCheck(seq.kind == scale_codec.TypeKind.Sequence);
        return (seq as scale_codec.SequenceType).type;
      }
    }
    throw Exception('Can\'t extract DigestItem from Digest');
  }

  @Cached()
  int _event() {
    var rec = _types()[_eventRecord()];
    assertionCheck(rec.kind == scale_codec.TypeKind.Composite);
    scale_codec.Field? eventField;
    for (var f in (rec as scale_codec.CompositeType).fields) {
      if (f.name == 'event') {
        eventField = f;
        break;
      }
    }
    assertionCheck(eventField != null);
    return eventField!.type;
  }

  @Cached()
  int _eventRecord() {
    var types = _types();
    var eventRecordList = _eventRecordList();
    var seq = types[eventRecordList];
    assertionCheck(seq.kind == scale_codec.TypeKind.Sequence);
    return (seq as scale_codec.SequenceType).type;
  }

  @Cached()
  int _eventRecordList() {
    return _getStorageItem('System', 'Events').value;
  }

  bool _isUnitType(scale_codec.Type type) {
    if (type.kind == scale_codec.TypeKind.Tuple) {
      try {
        return (type as scale_codec.TupleType).tuple.isEmpty;
      } catch (e) {
        rethrow;
      }
    }
    return false;
  }

  @Cached()
  int _signature() {
    var types = _types();

    scale_codec.Type signedExtensionsType = scale_codec.CompositeType(
      path: ['SignedExtensions'],
      fields: _metadata.extrinsic!.signedExtensions
          .map((ext) {
            return scale_codec.Field(name: ext.identifier, type: ext.type!);
          })
          .where((f) => !_isUnitType(types.getUnwrappedType(f.type)))
          .toList(),
    );

    types.add(signedExtensionsType);

    var signedExtensions = types.length - 1;

    scale_codec.Type signatureType = scale_codec.CompositeType(fields: [
      scale_codec.Field(
        name: 'address',
        type: _address(),
      ),
      scale_codec.Field(
        name: 'signature',
        type: _extrinsicSignature(),
      ),
      scale_codec.Field(name: 'signedExtensions', type: signedExtensions),
    ], path: [
      'ExtrinsicSignature'
    ]);
    types.add(signatureType);
    return types.length - 1;
  }

  @Cached()
  int _address() {
    return _getTypeParameter(_uncheckedExtrinsic(), 0);
  }

  @Cached()
  int _call() {
    return _getTypeParameter(_uncheckedExtrinsic(), 1);
  }

  @Cached()
  int _extrinsicSignature() {
    return _getTypeParameter(_uncheckedExtrinsic(), 2);
  }

  @Cached()
  int _uncheckedExtrinsic() {
    for (var i = 0; i < (_metadata.lookup?.types.length ?? 0); i++) {
      var def = _metadata.lookup!.types[i].type;
      if (def.path.isNotEmpty &&
          def.path[0] == 'sp_runtime' &&
          def.path.last == 'UncheckedExtrinsic') {
        return i;
      }
    }
    throw Exception('Failed to find UncheckedExtrinsic type in metadata');
  }

  int _getTypeParameter(int ti, int idx) {
    var def = _metadata.lookup!.types[ti];
    if (def.type.params.length <= idx) {
      var name = def.type.path.isNotEmpty ? def.type.path.join('::') : '$ti';
      throw Exception(
          'scale_codec.Type $name should have at least ${idx + 1} type parameter${idx > 0 ? 's' : ''}');
    }
    return assertNotNull(def.type.params[idx].type);
  }

  StorageItem _getStorageItem(String prefix, String name) {
    var storage = _storage();
    var item = storage[prefix]?[name];
    return assertNotNull(item, 'Can\'t find $prefix.$name storage item');
  }

  @Cached()
  Map<String, Map<String, StorageItem>> _storage() {
    var storage = <String, Map<String, StorageItem>>{};
    _metadata.pallets?.forEach((pallet) {
      if (pallet.storage == null) {
        return;
      }
      var items = storage[pallet.storage!.prefix] = <String, StorageItem>{};
      for (var e in pallet.storage!.items) {
        var hashers = <String>[];
        List<int> keys;
        switch (e.type.kind) {
          case 'Plain':
            hashers = [];
            keys = [];
            break;
          case 'Map':
            hashers = (e.type as StorageEntryTypeV14_Map)
                .hashers
                .map((h) => h.kind)
                .toList();
            if (hashers.length == 1) {
              keys = [(e.type as StorageEntryTypeV14_Map).key];
            } else {
              var keyDef = _types()[(e.type as StorageEntryTypeV14_Map).key];
              assertionCheck(keyDef.kind == scale_codec.TypeKind.Tuple);
              assertionCheck((keyDef as scale_codec.TupleType).tuple.length ==
                  hashers.length);
              keys = keyDef.tuple;
            }
            break;
          default:
            throw UnexpectedCaseException();
        }
        items[e.name] = StorageItem(
            modifier: e.modifier.kind,
            hashers: hashers,
            keys: keys,
            value: e.type.value,
            fallback: e.fallback,
            docs: e.docs);
      }
    });
    return storage;
  }

  @Cached()
  Map<String, Map<String, Constant>> _constants() {
    var constants = <String, Map<String, Constant>>{};
    _metadata.pallets?.forEach((pallet) {
      for (var c in pallet.constants) {
        var pc = constants[pallet.name] ??
            (constants[pallet.name] = <String, Constant>{});
        pc[c.name] = Constant(type: c.type, value: c.value, docs: c.docs);
      }
    });
    return constants;
  }

  @Cached()
  List<scale_codec.Type> _types() {
    List<scale_codec.Type> typesValue =
        _metadata.lookup?.types.map((PortableTypeV14 t) {
              var info = {'path': t.type.path, 'docs': t.type.docs};
              var def = t.type.def;
              switch (def.kind) {
                case 'Primitive':
                  return scale_codec.PrimitiveType(
                    primitive: (def as Si1TypeDef_Primitive).value.kind,
                    path: info['path'],
                    docs: info['docs'],
                  );
                case 'Compact':
                  // ignore: unnecessary_cast
                  return scale_codec.CompactType(
                    type: (def as Si1TypeDef_Compact).value.type,
                    path: info['path'],
                    docs: info['docs'],
                  ) as scale_codec.Type;
                case 'Sequence':
                  return scale_codec.SequenceType(
                    type: (def as Si1TypeDef_Sequence).value.type,
                    path: info['path'],
                    docs: info['docs'],
                  );
                case 'BitSequence':
                  return scale_codec.BitSequenceType(
                    bitStoreType:
                        (def as Si1TypeDef_BitSequence).value.bitStoreType,
                    bitOrderType: def.value.bitOrderType,
                    path: info['path'],
                    docs: info['docs'],
                  );
                case 'Array':
                  return scale_codec.ArrayType(
                    type: (def as Si1TypeDef_Array).value.type,
                    len: def.value.len,
                    path: info['path'],
                    docs: info['docs'],
                  );
                case 'Tuple':
                  return scale_codec.TupleType(
                    tuple: (def as Si1TypeDef_Tuple).value,
                    path: info['path'],
                    docs: info['docs'],
                  );
                case 'Composite':
                  return scale_codec.CompositeType(
                    fields: (def as Si1TypeDef_Composite).value.fields,
                    path: info['path'],
                    docs: info['docs'],
                  );
                case 'scale_codec.Variant':
                  return scale_codec.VariantType(
                    variants: (def as Si1TypeDef_Variant).value.variants,
                    path: info['path'],
                    docs: info['docs'],
                  );
                default:
                  throw UnexpectedCaseException(def.kind);
              }
            }).toList() ??
            <scale_codec.Type>[];
    return scale_codec.OldTypeRegistry().normalizeMetadataTypes(typesValue);
  }
}

@WithCache()
abstract class FromOld implements _$FromOld {
  late scale_codec.OldTypeRegistry _registry;
  factory FromOld(Metadata _metadata, LegacyTypes _legacyTypes) = _FromOld;

  /* 
   TODO: find a way to generate constructor with initialization
  
   _FromOld(this._metadata, this._legacyTypes) {
     _registry = OldTypeRegistry(_legacyTypes);
     _defineGenericExtrinsicEra();
     _defineGenericLookupSource();
     _defineOriginCaller();
     _defineGenericCall();
     _defineGenericEvent();
     _defineGenericSignature();
   }
   */

  ChainDescription convert() {
    var signature = _registry.getIndex('GenericSignature');
    var call = _registry.getIndex('GenericCall');
    var digest = _registry.getIndex('Digest');
    var digestItem = _registry.getIndex('DigestItem');
    var event = _registry.getIndex('GenericEvent');
    var eventRecord = _registry.getIndex('EventRecord');
    var eventRecordList = _registry.getIndex('Vec<EventRecord>');
    var storage = _storage();
    var constants = _constants();

    return ChainDescription(
        types: _registry.getTypes(),
        call: call,
        digest: digest,
        digestItem: digestItem,
        event: event,
        eventRecord: eventRecord,
        eventRecordList: eventRecordList,
        signature: signature,
        storage: storage,
        constants: constants);
  }

  void _defineGenericSignature() {
    _registry.define('GenericSignature', () {
      return scale_codec.CompositeType(fields: [
        scale_codec.Field(name: 'address', type: _registry.getIndex('Address')),
        scale_codec.Field(
            name: 'signature', type: _registry.getIndex('ExtrinsicSignature')),
        scale_codec.Field(name: 'signedExtensions', type: _signedExtensions()),
      ]);
    });
  }

  @Cached()
  int _signedExtensions() {
    var fields = <scale_codec.Field>[];
    switch (_metadata.kind) {
      case 'V9':
      case 'V10':
        _addSignedExtensionField(fields, 'CheckEra');
        _addSignedExtensionField(fields, 'CheckNonce');
        _addSignedExtensionField(fields, 'ChargeTransactionPayment');
        break;
      case 'V11':
      case 'V12':
      case 'V13':
        for (var name in _metadata.value.extrinsic.signedExtensions) {
          _addSignedExtensionField(fields, name);
        }
        break;
      default:
        throw UnexpectedCaseException(_metadata.kind);
    }
    return _registry.add(scale_codec.CompositeType(fields: fields));
  }

  void _addSignedExtensionField(List<scale_codec.Field> fields, String name) {
    var type = _getSignedExtensionType(name);
    if (type == null) return;
    fields.add(scale_codec.Field(name: name, type: type));
  }

  int? _getSignedExtensionType(String name) {
    var def = _legacyTypes.signedExtensions?[name];
    if (isNotEmpty(def)) {
      return _registry.getIndex(def);
    }
    switch (name) {
      case 'ChargeTransactionPayment':
        return _registry.getIndex('Compact<Balance>');
      case 'CheckMortality':
      case 'CheckEra':
        return _registry.getIndex('ExtrinsicEra');
      case 'CheckNonce':
        return _registry.getIndex('Compact<Index>');
      case 'CheckBlockGasLimit':
      case 'CheckGenesis':
      case 'CheckNonZeroSender':
      case 'CheckSpecVersion':
      case 'CheckTxVersion':
      case 'CheckVersion':
      case 'CheckWeight':
      case 'LockStakingStatus':
      case 'ValidateEquivocationReport':
        return null;
      default:
        throw Exception('Unknown signed extension: $name');
    }
  }

  void _defineGenericExtrinsicEra() {
    _registry.define('GenericExtrinsicEra', () {
      var variants = <scale_codec.Variant>[];

      variants.add(scale_codec.Variant(name: 'Immortal', fields: [], index: 0));

      for (var index = 1; index < 256; index++) {
        variants.add(scale_codec.Variant(
            name: 'Mortal$index',
            fields: [scale_codec.Field(type: _registry.getIndex('U8'))],
            index: index));
      }

      return scale_codec.VariantType(variants: variants);
    });
  }

  void _defineGenericCall() {
    _registry.define('GenericCall', () {
      var variants = <scale_codec.Variant>[];
      _forEachPallet(
        (AnyOldModule mod) => mod.calls,
        (AnyOldModule mod, int index) {
          variants.add(
            scale_codec.Variant(
              name: mod.name,
              index: index,
              fields: [
                scale_codec.Field(type: _makeCallEnum(mod.name, mod.calls!)),
              ],
            ),
          );
        },
      );
      return scale_codec.VariantType(variants: variants);
    });
  }

  void _defineGenericEvent() {
    _registry.define('GenericEvent', () {
      var variants = <scale_codec.Variant>[];
      _forEachPallet((AnyOldModule mod) => mod.events?.length,
          (AnyOldModule mod, int index) {
        variants.add(scale_codec.Variant(name: mod.name, index: index, fields: [
          scale_codec.Field(type: _makeEventEnum(mod.name, mod.events!))
        ]));
      });
      return scale_codec.VariantType(variants: variants);
    });
  }

  int _makeEventEnum(String palletName, List<EventMetadataV9> events) {
    var variants =
        events.asMap().entries.map((MapEntry<int, EventMetadataV9> entry) {
      int index = entry.key;
      EventMetadataV9 e = entry.value;
      var fields = e.args.map((arg) {
        return scale_codec.Field(
            type: _registry.getIndex(arg, pallet: palletName));
      }).toList();

      return scale_codec.Variant(
          index: index, name: e.name, fields: fields, docs: e.docs);
    }).toList();
    return _registry.add(scale_codec.VariantType(variants: variants));
  }

  int _makeCallEnum(String palletName, List<FunctionMetadataV9> calls) {
    var variants =
        calls.asMap().entries.map((MapEntry<int, FunctionMetadataV9> entry) {
      var index = entry.key;
      var call = entry.value;
      var fields = call.args.map((arg) {
        return scale_codec.Field(
            name: arg.name,
            type: _registry.getIndex(arg.type, pallet: palletName));
      }).toList();
      return scale_codec.Variant(
          index: index, name: call.name, fields: fields, docs: call.docs);
    }).toList();
    return _registry.add(scale_codec.VariantType(variants: variants));
  }

  void _defineGenericLookupSource() {
    _registry.define('GenericLookupSource', () {
      var variants = <scale_codec.Variant>[];
      for (var i = 0; i < 0xef; i++) {
        variants.add(scale_codec.Variant(name: 'Idx$i', fields: [], index: i));
      }
      variants.add(scale_codec.Variant(
          name: 'IdxU16',
          fields: [scale_codec.Field(type: _registry.getIndex('U16'))],
          index: 0xfc));
      variants.add(scale_codec.Variant(
          name: 'IdxU32',
          fields: [scale_codec.Field(type: _registry.getIndex('U32'))],
          index: 0xfd));
      variants.add(scale_codec.Variant(
          name: 'IdxU64',
          fields: [scale_codec.Field(type: _registry.getIndex('U64'))],
          index: 0xfe));
      variants.add(scale_codec.Variant(
          name: 'AccountId',
          fields: [scale_codec.Field(type: _registry.getIndex('AccountId'))],
          index: 0xff));
      return scale_codec.VariantType(variants: variants);
    });
  }

  @Cached()
  Map<String, Map<String, StorageItem>> _storage() {
    var storage = <String, Map<String, StorageItem>>{};
    _forEachPallet(null, (AnyOldModule _mod, _) {
      dynamic mod = _mod;
      if (mod.storage == null) {
        return;
      }
      var items = <String, StorageItem>{};
      items = storage[mod.storage.prefix] ?? <String, StorageItem>{};
      mod.storage.items.forEach((e) {
        var hashers = <String>[];
        var keys = <int>[];
        switch (e.type.kind) {
          case 'Plain':
            break;
          case 'Map':
            hashers = [e.type.hasher.kind];
            keys = [_registry.getIndex(e.type.key, pallet: mod.name)];
            break;
          case 'DoubleMap':
            hashers = [e.type.hasher.kind, e.type.key2Hasher.kind];
            keys = [
              _registry.getIndex(e.type.key1, pallet: mod.name),
              _registry.getIndex(e.type.key2, pallet: mod.name)
            ];
            break;
          case 'NMap':
            keys = e.type.keyVec
                .map((k) => _registry.getIndex(k, pallet: mod.name))
                .toList()
                .cast<int>();
            hashers = e.type.hashers
                .map((h) => h.kind.toString())
                .toList()
                .cast<String>();
            break;
          default:
            throw UnexpectedCaseException();
        }
        items[e.name] = StorageItem(
            modifier: e.modifier.kind,
            hashers: hashers,
            keys: keys,
            value: _registry.getIndex(e.type.value, pallet: mod.name),
            fallback: e.fallback,
            docs: e.docs);
      });
      storage[mod.storage.prefix] = items;
    });
    return storage;
  }

  @Cached()
  Map<String, Map<String, Constant>> _constants() {
    var constants = <String, Map<String, Constant>>{};
    _forEachPallet(null, (mod, _) {
      for (var c in mod.constants) {
        constants[mod.name] ??= <String, Constant>{};
        var pc = constants[mod.name]!;
        pc[c.name] = Constant(
            type: _registry.getIndex(c.type, pallet: mod.name),
            value: c.value,
            docs: c.docs);
      }
    });
    return constants;
  }

  void _defineOriginCaller() {
    _registry.define('OriginCaller', () {
      var variants = <scale_codec.Variant>[];
      _forEachPallet(null, (mod, index) {
        var name = mod.name;
        String type;
        switch (name) {
          case 'Authority':
            type = 'AuthorityOrigin';
            break;
          case 'Council':
          case 'TechnicalCommittee':
          case 'GeneralCouncil':
            type = 'CollectiveOrigin';
            break;
          case 'System':
            type = 'SystemOrigin';
            name = 'system';
            break;
          case 'Xcm':
          case 'XcmPallet':
            type = 'XcmOrigin';
            break;
          default:
            return;
        }
        variants.add(scale_codec.Variant(
            name: name,
            index: index,
            fields: [scale_codec.Field(type: _registry.getIndex(type))]));
      });
      return scale_codec.VariantType(
          variants: variants, path: ['OriginCaller']);
    });
  }

  void _forEachPallet(dynamic Function(AnyOldModule mod)? filter,
      void Function(AnyOldModule mod, int index) cb) {
    switch (_metadata.kind) {
      case 'V9':
      case 'V10':
      case 'V11':
        var index = 0;
        for (var mod in _metadata.value.modules) {
          if (filter != null && !isNotEmpty(filter(mod))) {
            continue;
          }
          cb(mod, index);
          index += 1;
        }
        return;

      case 'V12':
      case 'V13':
        for (var mod in _metadata.value.modules) {
          if (filter != null && !isNotEmpty(filter(mod))) {
            continue;
          }
          cb(mod, mod.index);
        }
        return;
    }
  }
}
