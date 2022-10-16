import 'dart:convert';
import 'dart:typed_data';

import 'package:polkadart_scale_codec/polkadart_scale_codec.dart'
    as scale_codec;
import 'package:substrate_metadata/old/definitions/xcm/src.dart' as xcm_types;

final Map<String, dynamic> _map = _createCodec();

final scale_codec.Codec codec = _map['codec']!;
final int _type = _map['type']!;

Map<String, dynamic> _createCodec() {
  var registry = scale_codec.OldTypeRegistry(types: xcm_types.types);
  var type = registry.getIndex('VersionedXcm');
  var types = registry.getTypes();
  var codec = scale_codec.Codec(types);

  return <String, dynamic>{'codec': codec, 'type': type};
}

///
/// Returns Map<String, dynamic> or VersionedXcm
dynamic decodeXcm(dynamic bytes, {bool return_map = false}) {
  var source = scale_codec.Source(bytes);
  var map = codec.decodeFromSource(_type, source);
  if (return_map) {
    return jsonDecode(jsonEncode(map,
        toEncodable: (Object? value) => value is BigInt
            ? value.toInt()
            : throw UnsupportedError('Cannot convert to JSON: $value')));
  }
  return map;
}

Uint8List encodeXcm(dynamic msg) {
  return scale_codec.decodeHex(codec.encode(_type, msg));
}
