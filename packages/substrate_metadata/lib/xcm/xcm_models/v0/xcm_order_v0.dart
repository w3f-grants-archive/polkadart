part of xcm_models;

abstract class XcmOrderV0 {
  final String kind;
  const XcmOrderV0(this.kind);

  static XcmOrderV0 fromMap(Map<String, dynamic> map) {
    switch (map['__kind']) {
      case 'Null':
        return XcmOrderV0_Null();
      case 'DepositAsset':
        return XcmOrderV0_DepositAsset.fromMap(map);
      case 'DepositReserveAsset':
        return XcmOrderV0_DepositReserveAsset.fromMap(map);
      case 'ExchangeAsset':
        return XcmOrderV0_ExchangeAsset.fromMap(map);
      case 'InitiateReserveWithdraw':
        return XcmOrderV0_InitiateReserveWithdraw.fromMap(map);
      case 'InitiateTeleport':
        return XcmOrderV0_InitiateTeleport.fromMap(map);
      case 'QueryHolding':
        return XcmOrderV0_QueryHolding.fromMap(map);
      case 'BuyExecution':
        return XcmOrderV0_BuyExecution.fromMap(map);
      default:
        throw UnexpectedCaseException(map['__kind']);
    }
  }
}

class XcmOrderV0_Null extends XcmOrderV0 {
  const XcmOrderV0_Null() : super('Null');
}

class XcmOrderV0_DepositAsset extends XcmOrderV0 {
  final List<MultiAssetV0> assets;
  final MultiLocationV0 dest;
  const XcmOrderV0_DepositAsset({required this.assets, required this.dest})
      : super('DepositAsset');

  static XcmOrderV0_DepositAsset fromMap(Map<String, dynamic> map) =>
      XcmOrderV0_DepositAsset(
          assets: (map['assets'] as List)
              .map((val) => MultiAssetV0.fromMap(val))
              .toList(),
          dest: MultiLocationV0.fromMap(map['dest']));
}

class XcmOrderV0_DepositReserveAsset extends XcmOrderV0 {
  final List<MultiAssetV0> assets;
  final MultiLocationV0 dest;
  final List<XcmOrderV0> effects;
  const XcmOrderV0_DepositReserveAsset(
      {required this.assets, required this.dest, required this.effects})
      : super('DepositReserveAsset');

  static XcmOrderV0_DepositReserveAsset fromMap(Map<String, dynamic> map) =>
      XcmOrderV0_DepositReserveAsset(
        assets: (map['assets'] as List)
            .map((val) => MultiAssetV0.fromMap(val))
            .toList(),
        dest: MultiLocationV0.fromMap(map['dest']),
        effects: (map['effects'] as List)
            .map((val) => XcmOrderV0.fromMap(val))
            .toList(),
      );
}

class XcmOrderV0_ExchangeAsset extends XcmOrderV0 {
  final List<MultiAssetV0> give;
  final List<MultiAssetV0> receive;
  const XcmOrderV0_ExchangeAsset({required this.give, required this.receive})
      : super('ExchangeAsset');

  static XcmOrderV0_ExchangeAsset fromMap(Map<String, dynamic> map) =>
      XcmOrderV0_ExchangeAsset(
        give: (map['give'] as List)
            .map((val) => MultiAssetV0.fromMap(val))
            .toList(),
        receive: (map['receive'] as List)
            .map((val) => MultiAssetV0.fromMap(val))
            .toList(),
      );
}

class XcmOrderV0_InitiateReserveWithdraw extends XcmOrderV0 {
  final List<MultiAssetV0> assets;
  final MultiLocationV0 reserve;
  final List<XcmOrderV0> effects;
  const XcmOrderV0_InitiateReserveWithdraw(
      {required this.assets, required this.reserve, required this.effects})
      : super('InitiateReserveWithdraw');

  static XcmOrderV0_InitiateReserveWithdraw fromMap(Map<String, dynamic> map) =>
      XcmOrderV0_InitiateReserveWithdraw(
        assets: (map['assets'] as List)
            .map((val) => MultiAssetV0.fromMap(val))
            .toList(),
        reserve: MultiLocationV0.fromMap(map['reserve']),
        effects: (map['effects'] as List)
            .map((val) => XcmOrderV0.fromMap(val))
            .toList(),
      );
}

class XcmOrderV0_InitiateTeleport extends XcmOrderV0 {
  final List<MultiAssetV0> assets;
  final MultiLocationV0 dest;
  final List<XcmOrderV0> effects;
  const XcmOrderV0_InitiateTeleport(
      {required this.assets, required this.dest, required this.effects})
      : super('InitiateTeleport');

  static XcmOrderV0_InitiateTeleport fromMap(Map<String, dynamic> map) =>
      XcmOrderV0_InitiateTeleport(
        assets: (map['assets'] as List)
            .map((val) => MultiAssetV0.fromMap(val))
            .toList(),
        dest: MultiLocationV0.fromMap(map['dest']),
        effects: (map['effects'] as List)
            .map((val) => XcmOrderV0.fromMap(val))
            .toList(),
      );
}

class XcmOrderV0_QueryHolding extends XcmOrderV0 {
  final BigInt queryId;
  final MultiLocationV0 dest;
  final List<MultiAssetV0> assets;
  const XcmOrderV0_QueryHolding(
      {required this.queryId, required this.dest, required this.assets})
      : super('QueryHolding');

  static XcmOrderV0_QueryHolding fromMap(Map<String, dynamic> map) =>
      XcmOrderV0_QueryHolding(
        queryId: parseBigInt(map['queryId']),
        dest: MultiLocationV0.fromMap(map['dest']),
        assets: (map['assets'] as List)
            .map((val) => MultiAssetV0.fromMap(val))
            .toList(),
      );
}

class XcmOrderV0_BuyExecution extends XcmOrderV0 {
  final MultiAssetV0 fees;
  final BigInt weight;
  final BigInt debt;
  final bool haltOnError;
  final List<XcmV0> xcm;

  const XcmOrderV0_BuyExecution({
    required this.fees,
    required this.weight,
    required this.debt,
    required this.haltOnError,
    required this.xcm,
  }) : super('BuyExecution');

  static XcmOrderV0_BuyExecution fromMap(Map<String, dynamic> map) =>
      XcmOrderV0_BuyExecution(
        fees: MultiAssetV0.fromMap(map['fees']),
        weight: parseBigInt(map['weight']),
        debt: parseBigInt(map['debt']),
        haltOnError: map['haltOnError'],
        xcm: (map['xcm'] as List).map((val) => XcmV0.fromMap(val)).toList(),
      );
}
