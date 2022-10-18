import 'package:test/test.dart';

import '../test_chain/chain.dart';

void main() {
  group('Chain: kusama', () {
    var obj = Chain('kusama');
    obj.testExtrinsicsScaleEncodingDecoding();
    //obj.testConstantsScaleEncodingDecoding();
    //obj.testEventsScaleEncodingDecoding();
  });
}
