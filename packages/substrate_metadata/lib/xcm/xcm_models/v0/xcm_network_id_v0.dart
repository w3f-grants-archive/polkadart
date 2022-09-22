part of xcm_models;

class XcmNetworkIdV0 {
  final String kind;
  const XcmNetworkIdV0(this.kind);

  /// Construct Object from Json
  static XcmNetworkIdV0 fromMap(Map<String, dynamic> map) {
    switch (map['__kind']) {
      case 'Any':
        return XcmNetworkIdV0_Any();
      case 'Named':
        return XcmNetworkIdV0_Named.fromMap(map);
      case 'Polkadot':
        return XcmNetworkIdV0_Polkadot();
      case 'Kusama':
        return XcmNetworkIdV0_Kusama();
      default:
        throw UnexpectedCaseException();
    }
  }
}

class XcmNetworkIdV0_Any extends XcmNetworkIdV0 {
  const XcmNetworkIdV0_Any() : super('Any');
}

class XcmNetworkIdV0_Named extends XcmNetworkIdV0 {
  final Uint8List value;
  const XcmNetworkIdV0_Named({required this.value}) : super('Named');

  /// Construct Object from Json
  static XcmNetworkIdV0_Named fromMap(Map<String, dynamic> map) =>
      XcmNetworkIdV0_Named(
          value: Uint8List.fromList((map['value'] as List).cast<int>()));
}

class XcmNetworkIdV0_Polkadot extends XcmNetworkIdV0 {
  const XcmNetworkIdV0_Polkadot() : super('Polkadot');
}

class XcmNetworkIdV0_Kusama extends XcmNetworkIdV0 {
  const XcmNetworkIdV0_Kusama() : super('Kusama');
}
