part of xcm_models;

abstract class XcmJunctionV1 {
  final String kind;
  const XcmJunctionV1(this.kind);

  static XcmJunctionV1 fromMap(Map<String, dynamic> map) {
    switch (map['__kind']) {
      case 'Parachain':
        return XcmJunctionV1_Parachain.fromMap(map);
      case 'AccountId32':
        return XcmJunctionV1_AccountId32.fromMap(map);
      case 'AccountIndex64':
        return XcmJunctionV1_AccountIndex64.fromMap(map);
      case 'AccountKey20':
        return XcmJunctionV1_AccountKey20.fromMap(map);
      case 'PalletInstance':
        return XcmJunctionV1_PalletInstance.fromMap(map);
      case 'GeneralIndex':
        return XcmJunctionV1_GeneralIndex.fromMap(map);
      case 'GeneralKey':
        return XcmJunctionV1_GeneralKey.fromMap(map);
      case 'OnlyChild':
        return XcmJunctionV1_OnlyChild();
      case 'Plurality':
        return XcmJunctionV1_Plurality.fromMap(map);
      default:
        throw UnexpectedCaseException(map['__kind']);
    }
  }
}

class XcmJunctionV1_Parachain extends XcmJunctionV1 {
  final int value;
  const XcmJunctionV1_Parachain({required this.value}) : super('Parachain');

  static XcmJunctionV1_Parachain fromMap(Map<String, dynamic> map) =>
      XcmJunctionV1_Parachain(value: map['value']);
}

class XcmJunctionV1_AccountId32 extends XcmJunctionV1 {
  final XcmNetworkIdV0 network;
  final Uint8List id;
  const XcmJunctionV1_AccountId32({required this.network, required this.id})
      : super('AccountId32');

  static XcmJunctionV1_AccountId32 fromMap(Map<String, dynamic> map) =>
      XcmJunctionV1_AccountId32(
          network: XcmNetworkIdV0.fromMap(map['network']),
          id: Uint8List.fromList((map['id'] as List).cast<int>()));
}

class XcmJunctionV1_AccountIndex64 extends XcmJunctionV1 {
  final XcmNetworkIdV0 network;
  final BigInt index;
  const XcmJunctionV1_AccountIndex64(
      {required this.network, required this.index})
      : super('AccountIndex64');

  static XcmJunctionV1_AccountIndex64 fromMap(Map<String, dynamic> map) =>
      XcmJunctionV1_AccountIndex64(
          network: XcmNetworkIdV0.fromMap(map['network']),
          index: parseBigInt(map['index']));
}

class XcmJunctionV1_AccountKey20 extends XcmJunctionV1 {
  final XcmNetworkIdV0 network;
  final Uint8List key;
  const XcmJunctionV1_AccountKey20({required this.network, required this.key})
      : super('AccountKey20');

  static XcmJunctionV1_AccountKey20 fromMap(Map<String, dynamic> map) =>
      XcmJunctionV1_AccountKey20(
          network: XcmNetworkIdV0.fromMap(map['network']),
          key: Uint8List.fromList((map['key'] as List).cast<int>()));
}

class XcmJunctionV1_PalletInstance extends XcmJunctionV1 {
  final int value;
  const XcmJunctionV1_PalletInstance({required this.value})
      : super('PalletInstance');

  static XcmJunctionV1_PalletInstance fromMap(Map<String, dynamic> map) =>
      XcmJunctionV1_PalletInstance(value: map['value']);
}

class XcmJunctionV1_GeneralIndex extends XcmJunctionV1 {
  final BigInt value;
  const XcmJunctionV1_GeneralIndex({required this.value})
      : super('GeneralIndex');

  static XcmJunctionV1_GeneralIndex fromMap(Map<String, dynamic> map) =>
      XcmJunctionV1_GeneralIndex(value: parseBigInt(map['value']));
}

class XcmJunctionV1_GeneralKey extends XcmJunctionV1 {
  final Uint8List value;
  const XcmJunctionV1_GeneralKey({required this.value}) : super('GeneralKey');

  static XcmJunctionV1_GeneralKey fromMap(Map<String, dynamic> map) =>
      XcmJunctionV1_GeneralKey(
          value: Uint8List.fromList((map['value'] as List).cast<int>()));
}

class XcmJunctionV1_OnlyChild extends XcmJunctionV1 {
  const XcmJunctionV1_OnlyChild() : super('OnlyChild');
}

class XcmJunctionV1_Plurality extends XcmJunctionV1 {
  final XcmBodyIdV0 id;
  final XcmBodyPartV0 part;
  const XcmJunctionV1_Plurality({required this.id, required this.part})
      : super('Plurality');

  static XcmJunctionV1_Plurality fromMap(Map<String, dynamic> map) =>
      XcmJunctionV1_Plurality(
          id: XcmBodyIdV0.fromMap(map['id']),
          part: XcmBodyPartV0.fromMap(map['part']));
}
