import 'package:test/test.dart';

import '../test_chain/chain.dart';

void main() {
  group('Chain: shibuya', () {
    var obj = Chain('shibuya');
    obj.testExtrinsicsScaleEncodingDecoding();
    obj.testConstantsScaleEncodingDecoding();
    obj.testEventsScaleEncodingDecoding();
  });
}
