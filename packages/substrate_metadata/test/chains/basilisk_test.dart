import 'package:test/test.dart';

import '../test_chain/chain.dart';

void main() {
  group('Chain: basilisk', () {
    var obj = Chain('basilisk');
    obj.testExtrinsicsScaleEncodingDecoding();
    obj.testConstantsScaleEncodingDecoding();
    obj.testEventsScaleEncodingDecoding();
  });
}
