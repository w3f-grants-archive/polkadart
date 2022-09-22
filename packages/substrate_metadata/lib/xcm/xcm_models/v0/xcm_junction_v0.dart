part of xcm_models;

abstract class XcmJunctionV0 {
  final String kind;
  const XcmJunctionV0(this.kind);

  static XcmJunctionV0 fromMap(Map<String, dynamic> map) {
    switch (map['__kind']) {
      case 'Parent':
        return XcmJunctionV0_Parent();
      case 'Parachain':
        return XcmJunctionV0_Parachain.fromMap(map);
      case 'AccountId32':
        return XcmJunctionV0_AccountId32.fromMap(map);
      case 'AccountIndex64':
        return XcmJunctionV0_AccountIndex64.fromMap(map);
      case 'AccountKey20':
        return XcmJunctionV0_AccountKey20.fromMap(map);
      case 'PalletInstance':
        return XcmJunctionV0_PalletInstance.fromMap(map);
      case 'GeneralIndex':
        return XcmJunctionV0_GeneralIndex.fromMap(map);
      case 'GeneralKey':
        return XcmJunctionV0_GeneralKey.fromMap(map);
      case 'OnlyChild':
        return XcmJunctionV0_OnlyChild();
      case 'Plurality':
        return XcmJunctionV0_Plurality.fromMap(map);
      default:
        throw UnexpectedCaseException();
    }
  }
}

class XcmJunctionV0_Parent extends XcmJunctionV0 {
  const XcmJunctionV0_Parent() : super('Parent');
}

class XcmJunctionV0_Parachain extends XcmJunctionV0 {
  final int value;

  const XcmJunctionV0_Parachain({required this.value}) : super('Parachain');

  static XcmJunctionV0_Parachain fromMap(Map<String, dynamic> map) =>
      XcmJunctionV0_Parachain(value: map['value']);
}

class XcmJunctionV0_AccountId32 extends XcmJunctionV0 {
  final XcmNetworkIdV0 network;
  final Uint8List id;
  const XcmJunctionV0_AccountId32({required this.network, required this.id})
      : super('AccountId32');

  static XcmJunctionV0_AccountId32 fromMap(Map<String, dynamic> map) =>
      XcmJunctionV0_AccountId32(
          network: XcmNetworkIdV0.fromMap(map['network']),
          id: Uint8List.fromList((map['id'] as List).cast<int>()));
}

class XcmJunctionV0_AccountIndex64 extends XcmJunctionV0 {
  final XcmNetworkIdV0 network;
  final BigInt index;

  const XcmJunctionV0_AccountIndex64(
      {required this.network, required this.index})
      : super('AccountIndex64');

  static XcmJunctionV0_AccountIndex64 fromMap(Map<String, dynamic> map) =>
      XcmJunctionV0_AccountIndex64(
        network: XcmNetworkIdV0.fromMap(map['network']),
        index: parseBigInt(map['index']),
      );
}

class XcmJunctionV0_AccountKey20 extends XcmJunctionV0 {
  final XcmNetworkIdV0 network;
  final Uint8List key;
  const XcmJunctionV0_AccountKey20({required this.network, required this.key})
      : super('AccountKey20');

  static XcmJunctionV0_AccountKey20 fromMap(Map<String, dynamic> map) =>
      XcmJunctionV0_AccountKey20(
          network: XcmNetworkIdV0.fromMap(map['network']),
          key: Uint8List.fromList((map['key'] as List).cast<int>()));
}

class XcmJunctionV0_PalletInstance extends XcmJunctionV0 {
  final int value;
  const XcmJunctionV0_PalletInstance({required this.value})
      : super('PalletInstance');

  static XcmJunctionV0_PalletInstance fromMap(Map<String, dynamic> map) =>
      XcmJunctionV0_PalletInstance(value: map['value']);
}

class XcmJunctionV0_GeneralIndex extends XcmJunctionV0 {
  final BigInt value;
  const XcmJunctionV0_GeneralIndex({required this.value})
      : super('GeneralIndex');

  static XcmJunctionV0_GeneralIndex fromMap(Map<String, dynamic> map) =>
      XcmJunctionV0_GeneralIndex(value: parseBigInt(map['value']));
}

class XcmJunctionV0_GeneralKey extends XcmJunctionV0 {
  final Uint8List value;
  const XcmJunctionV0_GeneralKey({required this.value}) : super('GeneralKey');

  static XcmJunctionV0_GeneralKey fromMap(Map<String, dynamic> map) =>
      XcmJunctionV0_GeneralKey(
          value: Uint8List.fromList((map['value'] as List).cast<int>()));
}

class XcmJunctionV0_OnlyChild extends XcmJunctionV0 {
  const XcmJunctionV0_OnlyChild() : super('OnlyChild');
}

class XcmJunctionV0_Plurality extends XcmJunctionV0 {
  final XcmBodyIdV0 id;
  final XcmBodyPartV0 part;
  const XcmJunctionV0_Plurality({required this.id, required this.part})
      : super('Plurality');

  static XcmJunctionV0_Plurality fromMap(Map<String, dynamic> map) =>
      XcmJunctionV0_Plurality(
          id: XcmBodyIdV0.fromMap(map['id']),
          part: XcmBodyPartV0.fromMap(map['part']));
}
