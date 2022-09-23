import 'dart:convert';
import 'dart:typed_data';
import 'package:substrate_metadata/old/type_registry.dart';
import 'package:polkadart_scale_codec/polkadart_scale_codec.dart'
    as scale_codec;
import 'package:substrate_metadata/old/definitions/xcm/src.dart' as xcm_types;
import 'package:substrate_metadata/xcm/xcm_models/xcm_models_base.dart';

final Map<String, dynamic> _map = _createCodec();

final scale_codec.Codec codec = _map['codec']!;
final int _type = _map['type']!;

Map<String, dynamic> _createCodec() {
  var registry = OldTypeRegistry(xcm_types.types);
  var type = registry.use('VersionedXcm');
  var types = registry.getTypes();
  var codec = scale_codec.Codec(types);

  return <String, dynamic>{'codec': codec, 'type': type};
}

///
/// Returns Map<String, dynamic> or VersionedXcm
dynamic decodeXcm(dynamic bytes, {bool return_map = false}) {
  var src = scale_codec.Src(bytes);
  var map = codec.decode(_type, src);
  if (return_map) {
    return jsonDecode(jsonEncode(map,
        toEncodable: (Object? value) => value is BigInt
            ? value.toInt()
            : throw UnsupportedError('Cannot convert to JSON: $value')));
  }
  return VersionedXcm.fromMap(map);
}

Uint8List encodeXcm(dynamic msg) {
  return codec.encodeToBinary(_type, msg);
}
