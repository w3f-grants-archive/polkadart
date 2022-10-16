import 'package:test/test.dart';

import '../test_chain/chain.dart';

void main() {
  group('Chain: shiden', () {
    var obj = Chain('shiden');
    obj.testExtrinsicsScaleEncodingDecoding();
    obj.testConstantsScaleEncodingDecoding();
    obj.testEventsScaleEncodingDecoding();
  });
}
