part of xcm_models;

abstract class XcmInstructionV2 {
  final String kind;
  const XcmInstructionV2(this.kind);

  static XcmInstructionV2 fromMap(Map<String, dynamic> map) {
    switch (map['__kind']) {
      case 'WithdrawAsset':
        return XcmInstructionV2_WithdrawAsset.fromMap(map);
      case 'ReserveAssetDeposited':
        return XcmInstructionV2_ReserveAssetDeposited.fromMap(map);
      case 'ReceiveTeleportedAsset':
        return XcmInstructionV2_ReceiveTeleportedAsset.fromMap(map);
      case 'QueryResponse':
        return XcmInstructionV2_QueryResponse.fromMap(map);
      case 'TransferAsset':
        return XcmInstructionV2_TransferAsset.fromMap(map);
      case 'TransferReserveAsset':
        return XcmInstructionV2_TransferReserveAsset.fromMap(map);
      case 'Transact':
        return XcmInstructionV2_Transact.fromMap(map);
      case 'HrmpNewChannelOpenRequest':
        return XcmInstructionV2_HrmpNewChannelOpenRequest.fromMap(map);
      case 'HrmpChannelAccepted':
        return XcmInstructionV2_HrmpChannelAccepted.fromMap(map);
      case 'HrmpChannelClosing':
        return XcmInstructionV2_HrmpChannelClosing.fromMap(map);
      case 'ClearOrigin':
        return XcmInstructionV2_ClearOrigin();
      case 'DescendOrigin':
        return XcmInstructionV2_DescendOrigin.fromMap(map);
      case 'ReportError':
        return XcmInstructionV2_ReportError.fromMap(map);
      case 'DepositAsset':
        return XcmInstructionV2_DepositAsset.fromMap(map);
      case 'DepositReserveAsset':
        return XcmInstructionV2_DepositReserveAsset.fromMap(map);
      case 'ExchangeAsset':
        return XcmInstructionV2_ExchangeAsset.fromMap(map);
      case 'InitiateReserveWithdraw':
        return XcmInstructionV2_InitiateReserveWithdraw.fromMap(map);
      case 'InitiateTeleport':
        return XcmInstructionV2_InitiateTeleport.fromMap(map);
      case 'QueryHolding':
        return XcmInstructionV2_QueryHolding.fromMap(map);
      case 'BuyExecution':
        return XcmInstructionV2_BuyExecution.fromMap(map);
      case 'RefundSurplus':
        return XcmInstructionV2_RefundSurplus();
      case 'SetErrorHandler':
        return XcmInstructionV2_SetErrorHandler.fromMap(map);
      case 'SetAppendix':
        return XcmInstructionV2_SetAppendix.fromMap(map);
      case 'ClearError':
        return XcmInstructionV2_ClearError();
      case 'ClaimAsset':
        return XcmInstructionV2_ClaimAsset.fromMap(map);
      case 'Trap':
        return XcmInstructionV2_Trap.fromMap(map);
      case 'SubscribeVersion':
        return XcmInstructionV2_SubscribeVersion.fromMap(map);
      case 'UnsubscribeVersion':
        return XcmInstructionV2_UnsubscribeVersion();
      default:
        throw UnexpectedCaseException(map['__kind']);
    }
  }
}

class XcmInstructionV2_WithdrawAsset extends XcmInstructionV2 {
  final List<MultiAssetV1> value;
  const XcmInstructionV2_WithdrawAsset({required this.value})
      : super('WithdrawAsset');

  static XcmInstructionV2_WithdrawAsset fromMap(Map<String, dynamic> map) =>
      XcmInstructionV2_WithdrawAsset(
          value: (map['value'] as List)
              .map((val) => MultiAssetV1.fromMap(val))
              .toList());
}

class XcmInstructionV2_ReserveAssetDeposited extends XcmInstructionV2 {
  final List<MultiAssetV1> value;
  const XcmInstructionV2_ReserveAssetDeposited({required this.value})
      : super('ReserveAssetDeposited');

  static XcmInstructionV2_ReserveAssetDeposited fromMap(
          Map<String, dynamic> map) =>
      XcmInstructionV2_ReserveAssetDeposited(
          value: (map['value'] as List)
              .map((val) => MultiAssetV1.fromMap(val))
              .toList());
}

class XcmInstructionV2_ReceiveTeleportedAsset extends XcmInstructionV2 {
  final List<MultiAssetV1> value;
  const XcmInstructionV2_ReceiveTeleportedAsset({required this.value})
      : super('ReceiveTeleportedAsset');

  static XcmInstructionV2_ReceiveTeleportedAsset fromMap(
          Map<String, dynamic> map) =>
      XcmInstructionV2_ReceiveTeleportedAsset(
          value: (map['value'] as List)
              .map((val) => MultiAssetV1.fromMap(val))
              .toList());
}

class XcmInstructionV2_QueryResponse extends XcmInstructionV2 {
  final BigInt queryId;
  final XcmResponseV2 response;
  final BigInt maxWeight;
  const XcmInstructionV2_QueryResponse(
      {required this.queryId, required this.response, required this.maxWeight})
      : super('QueryResponse');

  static XcmInstructionV2_QueryResponse fromMap(Map<String, dynamic> map) =>
      XcmInstructionV2_QueryResponse(
          queryId: parseBigInt(map['queryId']),
          response: XcmResponseV2.fromMap(map['response']),
          maxWeight: parseBigInt(map['maxWeight']));
}

class XcmInstructionV2_TransferAsset extends XcmInstructionV2 {
  final List<MultiAssetV1> assets;
  final MultiLocationV1 beneficiary;
  const XcmInstructionV2_TransferAsset({
    required this.assets,
    required this.beneficiary,
  }) : super('TransferAsset');

  static XcmInstructionV2_TransferAsset fromMap(Map<String, dynamic> map) =>
      XcmInstructionV2_TransferAsset(
          assets: (map['assets'] as List)
              .map((val) => MultiAssetV1.fromMap(val))
              .toList(),
          beneficiary: MultiLocationV1.fromMap(map['beneficiary']));
}

class XcmInstructionV2_TransferReserveAsset extends XcmInstructionV2 {
  final List<MultiAssetV1> assets;
  final MultiLocationV1 dest;
  final List<XcmInstructionV2> xcm;
  const XcmInstructionV2_TransferReserveAsset(
      {required this.assets, required this.dest, required this.xcm})
      : super('TransferReserveAsset');

  static XcmInstructionV2_TransferReserveAsset fromMap(
          Map<String, dynamic> map) =>
      XcmInstructionV2_TransferReserveAsset(
          assets: (map['assets'] as List)
              .map((val) => MultiAssetV1.fromMap(val))
              .toList(),
          dest: MultiLocationV1.fromMap(map['dest']),
          xcm: (map['xcm'] as List)
              .map((val) => XcmInstructionV2.fromMap(val))
              .toList());
}

class XcmInstructionV2_Transact extends XcmInstructionV2 {
  final XcmOriginKindV0 originType;
  final BigInt requireWeightAtMost;
  final Uint8List call;
  const XcmInstructionV2_Transact(
      {required this.originType,
      required this.requireWeightAtMost,
      required this.call})
      : super('Transact');

  static XcmInstructionV2_Transact fromMap(Map<String, dynamic> map) =>
      XcmInstructionV2_Transact(
          originType: XcmOriginKindV0.fromMap(map['originType']),
          requireWeightAtMost: parseBigInt(map['requireWeightAtMost']),
          call: Uint8List.fromList((map['call'] as List).cast<int>()));
}

class XcmInstructionV2_HrmpNewChannelOpenRequest extends XcmInstructionV2 {
  final int sender;
  final int maxMessageSize;
  final int maxCapacity;
  const XcmInstructionV2_HrmpNewChannelOpenRequest(
      {required this.sender,
      required this.maxMessageSize,
      required this.maxCapacity})
      : super('HrmpNewChannelOpenRequest');

  static XcmInstructionV2_HrmpNewChannelOpenRequest fromMap(
          Map<String, dynamic> map) =>
      XcmInstructionV2_HrmpNewChannelOpenRequest(
          sender: map['sender'],
          maxMessageSize: map['maxMessageSize'],
          maxCapacity: map['maxCapacity']);
}

class XcmInstructionV2_HrmpChannelAccepted extends XcmInstructionV2 {
  final int recipient;
  const XcmInstructionV2_HrmpChannelAccepted({required this.recipient})
      : super('HrmpChannelAccepted');

  static XcmInstructionV2_HrmpChannelAccepted fromMap(
          Map<String, dynamic> map) =>
      XcmInstructionV2_HrmpChannelAccepted(recipient: map['recipient']);
}

class XcmInstructionV2_HrmpChannelClosing extends XcmInstructionV2 {
  final int initiator;
  final int sender;
  final int recipient;
  const XcmInstructionV2_HrmpChannelClosing(
      {required this.initiator, required this.sender, required this.recipient})
      : super('HrmpChannelClosing');

  static XcmInstructionV2_HrmpChannelClosing fromMap(
          Map<String, dynamic> map) =>
      XcmInstructionV2_HrmpChannelClosing(
          initiator: map['initiator'],
          sender: map['sender'],
          recipient: map['recipient']);
}

class XcmInstructionV2_ClearOrigin extends XcmInstructionV2 {
  const XcmInstructionV2_ClearOrigin() : super('ClearOrigin');
}

class XcmInstructionV2_DescendOrigin extends XcmInstructionV2 {
  final XcmJunctionsV1 value;
  const XcmInstructionV2_DescendOrigin({required this.value})
      : super('DescendOrigin');

  static XcmInstructionV2_DescendOrigin fromMap(Map<String, dynamic> map) =>
      XcmInstructionV2_DescendOrigin(
          value: XcmJunctionsV1.fromMap(map['value']));
}

class XcmInstructionV2_ReportError extends XcmInstructionV2 {
  final BigInt queryId;
  final MultiLocationV1 dest;
  final BigInt maxResponseWeight;
  const XcmInstructionV2_ReportError(
      {required this.queryId,
      required this.dest,
      required this.maxResponseWeight})
      : super('ReportError');

  static XcmInstructionV2_ReportError fromMap(Map<String, dynamic> map) =>
      XcmInstructionV2_ReportError(
        queryId: parseBigInt(map['queryId']),
        dest: MultiLocationV1.fromMap(map['dest']),
        maxResponseWeight: parseBigInt(map['maxResponseWeight']),
      );
}

class XcmInstructionV2_DepositAsset extends XcmInstructionV2 {
  final MultiAssetFilterV1 assets;
  final int maxAssets;
  final MultiLocationV1 beneficiary;
  const XcmInstructionV2_DepositAsset(
      {required this.assets,
      required this.maxAssets,
      required this.beneficiary})
      : super('DepositAsset');

  static XcmInstructionV2_DepositAsset fromMap(Map<String, dynamic> map) =>
      XcmInstructionV2_DepositAsset(
          assets: MultiAssetFilterV1.fromMap(map['assets']),
          maxAssets: map['maxAssets'],
          beneficiary: MultiLocationV1.fromMap(map['beneficiary']));
}

class XcmInstructionV2_DepositReserveAsset extends XcmInstructionV2 {
  final MultiAssetFilterV1 assets;
  final int maxAssets;
  final MultiLocationV1 dest;
  final List<XcmInstructionV2> xcm;
  const XcmInstructionV2_DepositReserveAsset(
      {required this.assets,
      required this.maxAssets,
      required this.dest,
      required this.xcm})
      : super('DepositReserveAsset');

  static XcmInstructionV2_DepositReserveAsset fromMap(
          Map<String, dynamic> map) =>
      XcmInstructionV2_DepositReserveAsset(
          assets: MultiAssetFilterV1.fromMap(map['assets']),
          maxAssets: map['maxAssets'],
          dest: MultiLocationV1.fromMap(map['dest']),
          xcm: (map['xcm'] as List)
              .map((val) => XcmInstructionV2.fromMap(val))
              .toList());
}

class XcmInstructionV2_ExchangeAsset extends XcmInstructionV2 {
  final MultiAssetFilterV1 give;
  final List<MultiAssetV1> receive;
  const XcmInstructionV2_ExchangeAsset(
      {required this.give, required this.receive})
      : super('ExchangeAsset');

  static XcmInstructionV2_ExchangeAsset fromMap(Map<String, dynamic> map) =>
      XcmInstructionV2_ExchangeAsset(
          give: MultiAssetFilterV1.fromMap(map['give']),
          receive: (map['receive'] as List)
              .map((val) => MultiAssetV1.fromMap(val))
              .toList());
}

class XcmInstructionV2_InitiateReserveWithdraw extends XcmInstructionV2 {
  final MultiAssetFilterV1 assets;
  final MultiLocationV1 reserve;
  final List<XcmInstructionV2> xcm;
  const XcmInstructionV2_InitiateReserveWithdraw(
      {required this.assets, required this.reserve, required this.xcm})
      : super('InitiateReserveWithdraw');

  static XcmInstructionV2_InitiateReserveWithdraw fromMap(
          Map<String, dynamic> map) =>
      XcmInstructionV2_InitiateReserveWithdraw(
          assets: MultiAssetFilterV1.fromMap(map['assets']),
          reserve: MultiLocationV1.fromMap(map['reserve']),
          xcm: (map['xcm'] as List)
              .map((val) => XcmInstructionV2.fromMap(val))
              .toList());
}

class XcmInstructionV2_InitiateTeleport extends XcmInstructionV2 {
  final MultiAssetFilterV1 assets;
  final MultiLocationV1 dest;
  final List<XcmInstructionV2> xcm;
  const XcmInstructionV2_InitiateTeleport(
      {required this.assets, required this.dest, required this.xcm})
      : super('InitiateTeleport');

  static XcmInstructionV2_InitiateTeleport fromMap(Map<String, dynamic> map) =>
      XcmInstructionV2_InitiateTeleport(
          assets: MultiAssetFilterV1.fromMap(map['assets']),
          dest: MultiLocationV1.fromMap(map['dest']),
          xcm: (map['xcm'] as List)
              .map((val) => XcmInstructionV2.fromMap(val))
              .toList());
}

class XcmInstructionV2_QueryHolding extends XcmInstructionV2 {
  final BigInt queryId;
  final MultiLocationV1 dest;
  final MultiAssetFilterV1 assets;
  final BigInt maxResponseWeight;
  const XcmInstructionV2_QueryHolding(
      {required this.queryId,
      required this.dest,
      required this.assets,
      required this.maxResponseWeight})
      : super('QueryHolding');

  static XcmInstructionV2_QueryHolding fromMap(Map<String, dynamic> map) =>
      XcmInstructionV2_QueryHolding(
          queryId: parseBigInt(map['queryId']),
          dest: MultiLocationV1.fromMap(map['dest']),
          assets: MultiAssetFilterV1.fromMap(map['assets']),
          maxResponseWeight: parseBigInt(map['maxResponseWeight']));
}

class XcmInstructionV2_BuyExecution extends XcmInstructionV2 {
  final MultiAssetV1 fees;
  final XcmWeightLimitV2 weightLimit;
  const XcmInstructionV2_BuyExecution(
      {required this.fees, required this.weightLimit})
      : super('BuyExecution');

  static XcmInstructionV2_BuyExecution fromMap(Map<String, dynamic> map) =>
      XcmInstructionV2_BuyExecution(
          fees: MultiAssetV1.fromMap(map['fees']),
          weightLimit: XcmWeightLimitV2.fromMap(map['weightLimit']));
}

class XcmInstructionV2_RefundSurplus extends XcmInstructionV2 {
  const XcmInstructionV2_RefundSurplus() : super('RefundSurplus');
}

class XcmInstructionV2_SetErrorHandler extends XcmInstructionV2 {
  final List<XcmInstructionV2> value;
  const XcmInstructionV2_SetErrorHandler({required this.value})
      : super('SetErrorHandler');

  static XcmInstructionV2_SetErrorHandler fromMap(Map<String, dynamic> map) =>
      XcmInstructionV2_SetErrorHandler(
          value: (map['value'] as List)
              .map((val) => XcmInstructionV2.fromMap(val))
              .toList());
}

class XcmInstructionV2_SetAppendix extends XcmInstructionV2 {
  final List<XcmInstructionV2> value;
  const XcmInstructionV2_SetAppendix({required this.value})
      : super('SetAppendix');

  static XcmInstructionV2_SetAppendix fromMap(Map<String, dynamic> map) =>
      XcmInstructionV2_SetAppendix(
          value: (map['value'] as List)
              .map((val) => XcmInstructionV2.fromMap(val))
              .toList());
}

class XcmInstructionV2_ClearError extends XcmInstructionV2 {
  const XcmInstructionV2_ClearError() : super('ClearError');
}

class XcmInstructionV2_ClaimAsset extends XcmInstructionV2 {
  final List<MultiAssetV1> assets;
  final MultiLocationV1 ticket;
  const XcmInstructionV2_ClaimAsset(
      {required this.assets, required this.ticket})
      : super('ClaimAsset');

  static XcmInstructionV2_ClaimAsset fromMap(Map<String, dynamic> map) =>
      XcmInstructionV2_ClaimAsset(
          assets: (map['assets'] as List)
              .map((val) => MultiAssetV1.fromMap(val))
              .toList(),
          ticket: MultiLocationV1.fromMap(map['ticket']));
}

class XcmInstructionV2_Trap extends XcmInstructionV2 {
  final BigInt value;
  const XcmInstructionV2_Trap({required this.value}) : super('Trap');

  static XcmInstructionV2_Trap fromMap(Map<String, dynamic> map) =>
      XcmInstructionV2_Trap(value: parseBigInt(map['value']));
}

class XcmInstructionV2_SubscribeVersion extends XcmInstructionV2 {
  final BigInt queryId;
  final BigInt maxResponseWeight;
  const XcmInstructionV2_SubscribeVersion(
      {required this.queryId, required this.maxResponseWeight})
      : super('SubscribeVersion');

  static XcmInstructionV2_SubscribeVersion fromMap(Map<String, dynamic> map) =>
      XcmInstructionV2_SubscribeVersion(
          queryId: parseBigInt(map['queryId']),
          maxResponseWeight: parseBigInt(map['maxResponseWeight']));
}

class XcmInstructionV2_UnsubscribeVersion extends XcmInstructionV2 {
  const XcmInstructionV2_UnsubscribeVersion() : super('UnsubscribeVersion');
}
