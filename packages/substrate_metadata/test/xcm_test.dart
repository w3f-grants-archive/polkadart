import 'package:substrate_metadata/xcm/src.dart';
import 'package:test/test.dart';

void main() {
  final xcmHex1 =
      '0x000210010400010300a10f04320520000bf4a501cf4d010a1300010300a10f04320520000bf4a501cf4d010102286bee0d01000400010300e4201eaeb2f31d0d8321aef77936aa403a4ccc25';
  final xcmHex2 =
      '0x021000040000010608000c000bebc50fb22d140a130000010608000c000bebc50fb22d14010300286bee0d0100040001010016b8bbfec7ffe9b4ea5dd9b6d6146e96b6f56232a4f7628422133050a4b31069';

  final xcmMap1 = <String, dynamic>{
    'V0': {
      'TeleportAsset': {
        'assets': [
          {'All': null},
          {'AllAbstractFungible': []},
          {'All': null},
          {'AllNonFungible': null}
        ],
        'effects': [],
      }
    }
  };

  final xcmMap2 = <String, dynamic>{
    'V2': [
      {
        'WithdrawAsset': [
          {
            'id': {
              'Concrete': {
                'parents': 0,
                'interior': {
                  'X1': {
                    'GeneralKey': [0, 12]
                  }
                }
              }
            },
            'fungibility': {'Fungible': 22186493461995}
          }
        ]
      },
      {'ClearOrigin': null},
      {
        'BuyExecution': {
          'fees': {
            'id': {
              'Concrete': {
                'parents': 0,
                'interior': {
                  'X1': {
                    'GeneralKey': [0, 12]
                  }
                }
              }
            },
            'fungibility': {'Fungible': 22186493461995}
          },
          'weightLimit': {'Limited': 4000000000},
        }
      },
      {
        'DepositAsset': {
          'assets': {
            'Wild': {'All': null}
          },
          'maxAssets': 1,
          'beneficiary': {
            'parents': 0,
            'interior': {
              'X1': {
                'AccountId32': {
                  'network': {'Any': null},
                  'id': [
                    22,
                    184,
                    187,
                    254,
                    199,
                    255,
                    233,
                    180,
                    234,
                    93,
                    217,
                    182,
                    214,
                    20,
                    110,
                    150,
                    182,
                    245,
                    98,
                    50,
                    164,
                    247,
                    98,
                    132,
                    34,
                    19,
                    48,
                    80,
                    164,
                    179,
                    16,
                    105
                  ],
                }
              }
            }
          }
        }
      }
    ]
  };
  group('Xcm Tests', () {
    test('Decode Xcm Test', () {
      var map = decodeXcm(xcmHex1, return_map: true);
      expect(map, equals(xcmMap1));

      var map2 = decodeXcm(xcmHex2, return_map: true);

      expect(map2, equals(xcmMap2));
    });
  });
}
