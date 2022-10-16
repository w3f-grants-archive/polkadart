import 'package:test/test.dart';

import '../test_chain/chain.dart';

void main() {
  group('Chain: darwinia', () {
    var obj = Chain('darwinia');
    obj.testExtrinsicsScaleEncodingDecoding();
    obj.testConstantsScaleEncodingDecoding();
    obj.testEventsScaleEncodingDecoding();
  });
}
