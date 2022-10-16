import 'package:test/test.dart';

import '../test_chain/chain.dart';

void main() {
  group('Chain: khala', () {
    var obj = Chain('khala');
    obj.testExtrinsicsScaleEncodingDecoding();
    obj.testConstantsScaleEncodingDecoding();
    obj.testEventsScaleEncodingDecoding();
  });
}
