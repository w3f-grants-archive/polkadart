import 'package:test/test.dart';

import '../test_chain/chain.dart';

void main() {
  group('Chain: polkadot', () {
    var obj = Chain('polkadot');
    // obj.testExtrinsicsScaleEncodingDecoding();
    obj.testConstantsScaleEncodingDecoding();
    obj.testEventsScaleEncodingDecoding();
  });
}
