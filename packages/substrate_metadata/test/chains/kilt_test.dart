import 'package:test/test.dart';

import '../test_chain/chain.dart';

void main() {
  group('Chain: kilt', () {
    var obj = Chain('kilt');
    obj.testExtrinsicsScaleEncodingDecoding();
    obj.testConstantsScaleEncodingDecoding();
    obj.testEventsScaleEncodingDecoding();
  });
}
