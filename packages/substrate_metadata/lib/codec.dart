import 'dart:typed_data';

import 'package:polkadart_scale_codec/polkadart_scale_codec.dart' as scale;

import './old/definitions/metadata/index.dart' as metadata_definitions;
import 'models/models.dart' as model;

model.Metadata decodeMetadata(dynamic data) {
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

  // See https://github.com/polkadot-js/api/commit/a9211690be6b68ad6c6dad7852f1665cadcfa5b2
  // for why try-catch and version decoding stuff is here
  try {
    return decode(version, source);
  } catch (e) {
    if (version != 9) {
      rethrow;
    }
    try {
      source = scale.Source(content);
      source.u32();
      source.u8();
      return decode(10, source);
    } catch (anotherError) {
      rethrow;
    }
  }
}

model.Metadata decode(int version, scale.Source source) {
  var metadataVal = codec.decodeFromSource(versions[version - 9], source);
  source.assertEOF();
  var meta = model.Metadata.fromVersion(metadataVal, version);
  return meta;
}

Map<String, dynamic> createScaleCodec() {
  var registry = scale.OldTypeRegistry(types: metadata_definitions.types.types);
  var versions = List<int>.filled(6, 0);
  for (var i = 9; i < 15; i++) {
    versions[i - 9] = registry.getIndex('MetadataV$i');
  }

  return <String, dynamic>{
    'codec': scale.Codec(registry.getTypes()),
    'versions': versions
  };
}

final Map<String, dynamic> map = createScaleCodec();
final scale.Codec codec = map['codec']!;
final List<int> versions = map['versions']!;
