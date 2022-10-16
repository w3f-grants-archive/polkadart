import 'package:test/test.dart';

import '../test_chain/chain.dart';

void main() {
  group('Chain: statemine', () {
    var obj = Chain('statemine');
    obj.testExtrinsicsScaleEncodingDecoding();
    obj.testConstantsScaleEncodingDecoding();
    obj.testEventsScaleEncodingDecoding();
  });
}
