import 'package:test/test.dart';

import '../test_chain/chain.dart';

void main() {
  group('Chain: pioneer', () {
    var obj = Chain('pioneer');
    obj.testExtrinsicsScaleEncodingDecoding();
    obj.testConstantsScaleEncodingDecoding();
    obj.testEventsScaleEncodingDecoding();
  });
}
