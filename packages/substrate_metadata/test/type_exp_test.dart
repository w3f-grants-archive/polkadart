import 'package:polkadart_scale_codec/polkadart_scale_codec.dart' as scale;
import 'package:test/test.dart';

void main() {
  group('Type expressions', () {
    ast('A', scale.RegistryNamedType(name: 'A', params: []));

    ast(
      '[A; 10]',
      scale.RegistryArrayType(
          item: scale.RegistryNamedType(name: 'A', params: []), len: 10),
    );

    ast(
        '[u8; 16; H128]',
        scale.RegistryArrayType(
            item: scale.RegistryNamedType(name: 'u8', params: []), len: 16));

    ast(
        '(A, B, [u8; 5])',
        scale.RegistryTupleType(params: [
          scale.RegistryNamedType(name: 'A', params: []),
          scale.RegistryNamedType(name: 'B', params: []),
          scale.RegistryArrayType(
              item: scale.RegistryNamedType(name: 'u8', params: []), len: 5)
        ]));

    testFunction('A');
    testFunction('Vec<u8>');
    testFunction('[A; 20]');
    testFunction('(A, B, C, [Foo; 5])');
    testFunction('Vec<(NominatorIndex, [CompactScore; 0], ValidatorIndex)>');
    testFunction('Result<(), DispatchError>');

    testFunction(
        '<T::InherentOfflineReport as InherentOfflineReport>::Inherent',
        'InherentOfflineReport');
    testFunction('<T::Balance as HasCompact>', 'Compact<Balance>');
    testFunction('<T as Trait<I>>::Proposal', 'Proposal');
    testFunction('rstd::marker::PhantomData<(AccountId, Event)>',
        'PhantomData<(AccountId, Event)>');

    testFunction(
        'Vec<(T::AccountId,<<T as pallet_proxy::Config>::Currency as frame_support::traits::Currency<<T as frame_system::Config>::AccountId,>>::Balance, (BoundedVec<ProxyDefinition<T::AccountId, T::ProxyType, T::BlockNumber>,<T as pallet_proxy::Config>::MaxProxies,>,<<T as pallet_proxy::Config>::Currency as frame_support::traits::Currency<<T as frame_system::Config>::AccountId,>>::Balance,),)>',
        'Vec<(AccountId, Balance, (BoundedVec<ProxyDefinition<AccountId, ProxyType, BlockNumber>, MaxProxies>, Balance))>');

    testFunction('EthHeaderBrief::<T::AccountId>', 'EthHeaderBrief<AccountId>');
  });
}

void testFunction(String exp, [String? result]) {
  test(result != null ? '$exp -> $result' : exp, () {
    var type = scale.TypeExpParser(exp).parse();
    var printed = type.toString();
    expect(printed, equals(result ?? exp));
  });
}

void ast(String exp, scale.RegistryType type) {
  test('AST: $exp', () {
    var parsed = scale.TypeExpParser(exp).parse();
    expect(parsed, type);
  });
}
