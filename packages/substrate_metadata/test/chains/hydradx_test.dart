import 'package:test/test.dart';

import '../test_chain/chain.dart';

void main() {
  group('Chain: hydradx', () {
    var obj = Chain('hydradx');
    obj.testExtrinsicsScaleEncodingDecoding();
    obj.testConstantsScaleEncodingDecoding();
    obj.testEventsScaleEncodingDecoding();
  });
}
