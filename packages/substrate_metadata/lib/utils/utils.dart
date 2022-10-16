import 'dart:convert';

import 'package:cryptography/dart.dart';
import 'package:polkadart_scale_codec/polkadart_scale_codec.dart' as scale;
import '../models/models.dart' show Metadata;

String sha256(dynamic data) {
  late String content;

  if (data is String) {
    content = data;
  } else {
    // stringify the hashmap
    content = jsonEncode(data);
  }

  final algorithm = const DartSha256();

  // sinker to which all the hashes will be appended and then (hashed or digested) at last step;
  final sink = algorithm.newHashSink();

  // add content to sinker to be hashed
  sink.add(utf8.encode(content));

  // close the sink to be able to hash/digest
  sink.close();

  return scale.encodeHex(sink.hashSync().bytes);
}

bool isPreV14(Metadata metadata) {
  switch (metadata.kind) {
    case 'V0':
    case 'V1':
    case 'V2':
    case 'V3':
    case 'V4':
    case 'V5':
    case 'V6':
    case 'V7':
    case 'V8':
    case 'V9':
    case 'V10':
    case 'V11':
    case 'V12':
    case 'V13':
      return true;
    default:
      return false;
  }
}
