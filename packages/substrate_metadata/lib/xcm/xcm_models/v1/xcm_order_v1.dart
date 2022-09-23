part of xcm_models;

abstract class XcmOrderV1 {
  final String kind;
  const XcmOrderV1(this.kind);

  static XcmOrderV1 fromMap(Map<String, dynamic> map) {
    switch (map['__kind']) {
      case 'Noop':
        return XcmOrderV1_Noop();
      case 'DepositAsset':
        return XcmOrderV1_DepositAsset.fromMap(map);
      case 'DepositReserveAsset':
        return XcmOrderV1_DepositReserveAsset.fromMap(map);
      case 'ExchangeAsset':
        return XcmOrderV1_ExchangeAsset.fromMap(map);
      case 'InitiateReserveWithdraw':
        return XcmOrderV1_InitiateReserveWithdraw.fromMap(map);
      case 'InitiateTeleport':
        return XcmOrderV1_InitiateTeleport.fromMap(map);
      case 'QueryHolding':
        return XcmOrderV1_QueryHolding.fromMap(map);
      case 'BuyExecution':
        return XcmOrderV1_BuyExecution.fromMap(map);
      default:
        throw UnexpectedCaseException(map['__kind']);
    }
  }
}

class XcmOrderV1_Noop extends XcmOrderV1 {
  const XcmOrderV1_Noop() : super('Noop');
}

class XcmOrderV1_DepositAsset extends XcmOrderV1 {
  final MultiAssetFilterV1 assets;
  final int maxAssets;
  final MultiLocationV1 beneficiary;
  const XcmOrderV1_DepositAsset(
      {required this.assets,
      required this.maxAssets,
      required this.beneficiary})
      : super('DepositAsset');

  static XcmOrderV1_DepositAsset fromMap(Map<String, dynamic> map) =>
      XcmOrderV1_DepositAsset(
          assets: MultiAssetFilterV1.fromMap(map['assets']),
          maxAssets: map['maxAssets'],
          beneficiary: MultiLocationV1.fromMap(map['beneficiary']));
}

class XcmOrderV1_DepositReserveAsset extends XcmOrderV1 {
  final MultiAssetFilterV1 assets;
  final int maxAssets;
  final MultiLocationV1 dest;
  final List<XcmOrderV1> effects;
  const XcmOrderV1_DepositReserveAsset(
      {required this.assets,
      required this.maxAssets,
      required this.dest,
      required this.effects})
      : super('DepositReserveAsset');

  static XcmOrderV1_DepositReserveAsset fromMap(Map<String, dynamic> map) =>
      XcmOrderV1_DepositReserveAsset(
          assets: MultiAssetFilterV1.fromMap(map['assets']),
          maxAssets: map['maxAssets'],
          dest: MultiLocationV1.fromMap(map['dest']),
          effects: (map['effects'] as List)
              .map((val) => XcmOrderV1.fromMap(val))
              .toList());
}

class XcmOrderV1_ExchangeAsset extends XcmOrderV1 {
  final MultiAssetFilterV1 give;
  final List<MultiAssetV1> receive;
  const XcmOrderV1_ExchangeAsset({required this.give, required this.receive})
      : super('ExchangeAsset');

  static XcmOrderV1_ExchangeAsset fromMap(Map<String, dynamic> map) =>
      XcmOrderV1_ExchangeAsset(
          give: MultiAssetFilterV1.fromMap(map['give']),
          receive: (map['receive'] as List)
              .map((val) => MultiAssetV1.fromMap(val))
              .toList());
}

class XcmOrderV1_InitiateReserveWithdraw extends XcmOrderV1 {
  final MultiAssetFilterV1 assets;
  final MultiLocationV1 reserve;
  final List<XcmOrderV1> effects;
  const XcmOrderV1_InitiateReserveWithdraw(
      {required this.assets, required this.reserve, required this.effects})
      : super('InitiateReserveWithdraw');

  static XcmOrderV1_InitiateReserveWithdraw fromMap(Map<String, dynamic> map) =>
      XcmOrderV1_InitiateReserveWithdraw(
          assets: MultiAssetFilterV1.fromMap(map['assets']),
          reserve: MultiLocationV1.fromMap(map['reserve']),
          effects: (map['effects'] as List)
              .map((val) => XcmOrderV1.fromMap(val))
              .toList());
}

class XcmOrderV1_InitiateTeleport extends XcmOrderV1 {
  final MultiAssetFilterV1 assets;
  final MultiLocationV1 dest;
  final List<XcmOrderV1> effects;
  const XcmOrderV1_InitiateTeleport(
      {required this.assets, required this.dest, required this.effects})
      : super('InitiateTeleport');

  static XcmOrderV1_InitiateTeleport fromMap(Map<String, dynamic> map) =>
      XcmOrderV1_InitiateTeleport(
        assets: MultiAssetFilterV1.fromMap(map['assets']),
        dest: MultiLocationV1.fromMap(map['dest']),
        effects: (map['effects'] as List)
            .map((val) => XcmOrderV1.fromMap(val))
            .toList(),
      );
}

class XcmOrderV1_QueryHolding extends XcmOrderV1 {
  final BigInt queryId;
  final MultiLocationV1 dest;
  final MultiAssetFilterV1 assets;
  const XcmOrderV1_QueryHolding(
      {required this.queryId, required this.dest, required this.assets})
      : super('QueryHolding');

  static XcmOrderV1_QueryHolding fromMap(Map<String, dynamic> map) =>
      XcmOrderV1_QueryHolding(
        queryId: parseBigInt(map['queryId']),
        dest: MultiLocationV1.fromMap(map['dest']),
        assets: MultiAssetFilterV1.fromMap(map['assets']),
      );
}

class XcmOrderV1_BuyExecution extends XcmOrderV1 {
  final MultiAssetV1 fees;
  final BigInt weight;
  final BigInt debt;
  final bool haltOnError;
  final List<XcmV1> instructions;
  const XcmOrderV1_BuyExecution(
      {required this.fees,
      required this.weight,
      required this.debt,
      required this.haltOnError,
      required this.instructions})
      : super('BuyExecution');

  static XcmOrderV1_BuyExecution fromMap(Map<String, dynamic> map) =>
      XcmOrderV1_BuyExecution(
          fees: MultiAssetV1.fromMap(map['fees']),
          weight: parseBigInt(map['weight']),
          debt: parseBigInt(map['debt']),
          haltOnError: map['haltOnError'],
          instructions: (map['instructions'] as List)
              .map((val) => XcmV1.fromMap(val))
              .toList());
}
