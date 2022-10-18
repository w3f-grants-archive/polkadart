import 'dart:typed_data';

import 'package:polkadart_scale_codec/polkadart_scale_codec.dart'
    as scale_codec;
import 'package:substrate_metadata/utils/byte_decoder.dart';
import 'package:substrate_metadata/utils/common_utils.dart';

import 'chainDescription.dart';

dynamic decodeExtrinsic(dynamic rawExtrinsic, ChainDescription chainDescription,
    [scale_codec.Codec? codec]) {
  codec = codec ?? scale_codec.Codec(chainDescription.types);

  var source = scale_codec.Source(rawExtrinsic);
  source.uncompact();

  var meta = source.u8();

  ///
  /// 0b10000000 ~ 128 in BigInt
  var signed = meta & BigInt.from(128).toInt();

  ///
  /// 0b01111111 ~ 127 in BigInt
  var version = meta & BigInt.from(127).toInt();

  assertionCheck(version == 4, 'unsupported extrinsic version');

  if (isNotEmpty(signed)) {
    var signature = codec.decodeFromSource(chainDescription.signature, source);
    var call = codec.decodeFromSource(chainDescription.call, source);
    return {'version': 4, 'signature': signature, 'call': call};
  } else {
    return {
      'version': 4,
      'call': codec.decodeFromSource(chainDescription.call, source)
    };
  }
}

List<int> encodeExtrinsic(Map<String, dynamic> extrinsic,
    ChainDescription chainDescription, scale_codec.Codec? codec) {
  assertionCheck(extrinsic['version'] == 4, 'unsupported extrinsic version');
  codec = codec ?? scale_codec.Codec(chainDescription.types);
  var sink = ByteDecoder();

  var meta = 4;
  if (extrinsic['signature'] != null) {
    ///
    /// 0b10000000 ~ 128 in BigInt
    meta |= BigInt.from(128).toInt();
  }

  sink.u8(meta);
  if (extrinsic['signature'] != null) {
    codec.encodeWithSink(
        chainDescription.signature, extrinsic['signature'], sink);
  }
  codec.encodeWithSink(chainDescription.call, extrinsic['call'], sink);

  var bytes = sink.toBytes();
  sink = ByteDecoder();
  sink.compact(bytes.length);
  sink.bytes(bytes);
  return sink.toBytes();
}
