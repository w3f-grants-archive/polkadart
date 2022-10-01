import 'dart:typed_data';
import 'package:polkadart_scale_codec/polkadart_scale_codec.dart'
    as scale_codec;
import 'package:substrate_metadata/utils/common_utils.dart';
import 'chainDescription.dart';

dynamic decodeExtrinsic(dynamic rawExtrinsic, ChainDescription chainDescription,
    [scale_codec.Codec? codec]) {
  codec = codec ?? scale_codec.Codec(chainDescription.types);

  var src = scale_codec.Src(rawExtrinsic);
  src.compact();

  var meta = src.u8();

  ///
  /// 0b10000000 ~ 128 in BigInt
  var signed = meta & BigInt.from(128).toInt();

  ///
  /// 0b01111111 ~ 127 in BigInt
  var version = meta & BigInt.from(127).toInt();

  assertionCheck(version == 4, 'unsupported extrinsic version');

  if (isNotEmpty(signed)) {
    var signature = codec.decode(chainDescription.signature, src);
    var call = codec.decode(chainDescription.call, src);
    return {'version': 4, 'signature': signature, 'call': call};
  } else {
    return {'version': 4, 'call': codec.decode(chainDescription.call, src)};
  }
}

Uint8List encodeExtrinsic(Map<String, dynamic> extrinsic,
    ChainDescription chainDescription, scale_codec.Codec? codec) {
  assertionCheck(extrinsic['version'] == 4, 'unsupported extrinsic version');
  codec = codec ?? scale_codec.Codec(chainDescription.types);
  var sink = scale_codec.ByteSink();

  var meta = 4;
  if (extrinsic['signature'] != null) {
    ///
    /// 0b10000000 ~ 128 in BigInt
    meta |= BigInt.from(128).toInt();
  }

  sink.u8(meta);
  if (extrinsic['signature'] != null) {
    codec.encode(chainDescription.signature, extrinsic['signature'], sink);
  }
  codec.encode(chainDescription.call, extrinsic['call'], sink);

  var bytes = sink.toBytes();
  sink = scale_codec.ByteSink();
  sink.compact(bytes.length);
  sink.bytes(bytes);
  return sink.toBytes();
}
