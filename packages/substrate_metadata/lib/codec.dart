import 'dart:typed_data';

import 'package:polkadart_scale_codec/polkadart_scale_codec.dart' as scale;

import './old/definitions/metadata/index.dart' as metadata_definitions;
import 'models/models.dart' as model;

/// (Singleton Class)
///
/// It helps to create a single instance of [MetadataDecoder] which helps to decode Metadata.
///
/// ```dart
/// var decodedMetadata = MetadataDecode.decode('0x090820....');
/// ```
class MetadataDecoder {
  static final MetadataDecoder instance = MetadataDecoder._internal();

  /// Used to store single created instance of Scale-Codec
  late scale.Codec _codec;

  /// Used to store versions of metadata
  late List<int> _versions;

  factory MetadataDecoder() => instance;

  MetadataDecoder._internal() {
    _createScaleCodec();
  }

  ///
  /// Decodes metadata and returns [Metadata] model
  ///
  /// [data] can be ( Hexa-Decimal [String] || [Uint8List] bytes )
  ///
  model.Metadata decode(dynamic data) {
    scale.assertionCheck(data is String || data is Uint8List);
    late Uint8List content;
    if (data is String) {
      content = scale.decodeHex(data);
    } else {
      content = data;
    }
    var source = scale.Source(content);

    var magic = source.u32();
    scale.assertionCheck(
        magic == 0x6174656d, 'No magic number 0x6174656d at the start of data');

    var version = source.u8();
    scale.assertionCheck(
        9 <= version && version < 15, 'Invalid metadata version');

    // Kusama Hack
    // See https://github.com/polkadot-js/api/commit/a9211690be6b68ad6c6dad7852f1665cadcfa5b2
    // for why try-catch and version decoding stuff is here
    try {
      return _decode(version, source);
    } catch (e) {
      if (version != 9) {
        rethrow;
      }
      try {
        source = scale.Source(content);
        source.u32();
        source.u8();
        return _decode(10, source);
      } catch (unknownError) {
        rethrow;
      }
    }
  }

  /// Create scale codec to help in decoding the [Source]
  void _createScaleCodec() {
    var registry = scale.TypeRegistry(types: metadata_definitions.types.types);
    var versions = List<int>.filled(6, 0);
    for (var i = 9; i < 15; i++) {
      versions[i - 9] = registry.getIndex('MetadataV$i');
    }

    _codec = scale.Codec(registry.getTypes());
    _versions = versions;
  }

  /// decodes metadata from the correct match of the metadata version
  model.Metadata _decode(int version, scale.Source source) {
    var metadataVal = _codec.decodeFromSource(_versions[version - 9], source);
    source.assertEOF();
    var meta = model.Metadata.fromVersion(metadataVal, version);
    return meta;
  }
}