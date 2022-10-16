import 'package:test/test.dart';

import '../test_chain/chain.dart';

void main() {
  group('Chain: moonriver', () {
    var obj = Chain('moonriver');
    obj.testExtrinsicsScaleEncodingDecoding();
    obj.testConstantsScaleEncodingDecoding();
    obj.testEventsScaleEncodingDecoding();
  });
}
