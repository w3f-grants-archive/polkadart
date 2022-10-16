import 'package:test/test.dart';

import '../test_chain/chain.dart';

void main() {
  group('Chain: kintsugi', () {
    var obj = Chain('kintsugi');
    obj.testExtrinsicsScaleEncodingDecoding();
    obj.testConstantsScaleEncodingDecoding();
    obj.testEventsScaleEncodingDecoding();
  });
}
