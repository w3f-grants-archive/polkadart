import 'package:test/test.dart';

import '../test_chain/chain.dart';

void main() {
  group('Chain: crust', () {
    var obj = Chain('crust');
    obj.testExtrinsicsScaleEncodingDecoding();
    obj.testConstantsScaleEncodingDecoding();
    obj.testEventsScaleEncodingDecoding();
  });
}
