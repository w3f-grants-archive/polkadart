import 'package:test/test.dart';

import '../test_chain/chain.dart';

void main() {
  group('Chain: clover', () {
    var obj = Chain('clover');
    obj.testExtrinsicsScaleEncodingDecoding();
    obj.testConstantsScaleEncodingDecoding();
    obj.testEventsScaleEncodingDecoding();
  });
}
