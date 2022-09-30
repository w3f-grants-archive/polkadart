import 'package:polkadart_scale_codec/polkadart_scale_codec.dart'
    show assertNotNull, TypeKind;

import 'types.dart';
import 'types_hashing.dart' show getTypeHash;
import 'utils/utils.dart' show sha256;

class Definition extends Variant {
  final String pallet;

  @override
  List<Field> fields;
  @override
  List<String>? docs;
  Definition(
      {this.fields = const <Field>[],
      required int index,
      required this.pallet,
      required String name,
      this.docs})
      : super(fields: fields, docs: docs, index: index, name: name);
}

class Registry {
  final _definitions = <String, Definition>{};

  Map<String, Definition> get definitions => _definitions;

  final _hashes = <String, String>{};
  late List<Type> _types;

  Registry(List<Type> types, int ti) {
    _types = types;
    var pallets = types[ti];
    assertNotNull(pallets.kind == TypeKind.Variant);

    for (var pallet in (pallets as VariantType).variants) {
      assertNotNull(pallet.fields.length == 1);
      var palletType = types[pallet.fields[0].type];
      assertNotNull(palletType.kind == TypeKind.Variant);
      for (var def in (palletType as VariantType).variants) {
        _definitions['${pallet.name}.${def.name}'] = Definition(
          fields: def.fields,
          index: def.index,
          pallet: pallet.name,
          name: def.name,
          docs: def.docs,
        );
      }
    }
  }

  Definition get(String name) {
    if (_definitions[name] == null) {
      throw Exception('$name not found');
    }
    return _definitions[name]!;
  }

  String getHash(String name) {
    var hash = _hashes[name];
    if (hash == null) {
      return _hashes[name] = _computeHash(name);
    } else {
      return hash;
    }
  }

  String _computeHash(String name) {
    var def = get(name);
    var fields = def.fields.map((f) {
      return <String, dynamic>{
        'name': f.name,
        'type': getTypeHash(_types, f.type)
      };
    });
    return sha256(fields);
  }
}
