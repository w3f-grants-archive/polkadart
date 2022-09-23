part of xcm_models;

abstract class XcmV1 {
  final String kind;
  const XcmV1(this.kind);

  static XcmV1 fromMap(Map<String, dynamic> map) {
    switch (map['__kind']) {
      case 'WithdrawAsset':
        return XcmV1_WithdrawAsset.fromMap(map);
      case 'ReserveAssetDeposited':
        return XcmV1_ReserveAssetDeposited.fromMap(map);
      case 'ReceiveTeleportedAsset':
        return XcmV1_ReceiveTeleportedAsset.fromMap(map);
      case 'QueryResponse':
        return XcmV1_QueryResponse.fromMap(map);
      case 'TransferAsset':
        return XcmV1_TransferAsset.fromMap(map);
      case 'TransferReserveAsset':
        return XcmV1_TransferReserveAsset.fromMap(map);
      case 'Transact':
        return XcmV1_Transact.fromMap(map);
      case 'HrmpNewChannelOpenRequest':
        return XcmV1_HrmpNewChannelOpenRequest.fromMap(map);
      case 'HrmpChannelAccepted':
        return XcmV1_HrmpChannelAccepted.fromMap(map);
      case 'HrmpChannelClosing':
        return XcmV1_HrmpChannelClosing.fromMap(map);
      case 'RelayedFrom':
        return XcmV1_RelayedFrom.fromMap(map);
      case 'SubscribeVersion':
        return XcmV1_SubscribeVersion.fromMap(map);
      case 'UnsubscribeVersion':
        return XcmV1_UnsubscribeVersion();
      default:
        throw UnexpectedCaseException(map['__kind']);
    }
  }
}

class XcmV1_WithdrawAsset extends XcmV1 {
  final List<MultiAssetV1> assets;
  final List<XcmOrderV1> effects;
  const XcmV1_WithdrawAsset({required this.assets, required this.effects})
      : super('WithdrawAsset');

  static XcmV1_WithdrawAsset fromMap(Map<String, dynamic> map) =>
      XcmV1_WithdrawAsset(
        assets: (map['assets'] as List)
            .map((val) => MultiAssetV1.fromMap(val))
            .toList(),
        effects: (map['effects'] as List)
            .map((val) => XcmOrderV1.fromMap(val))
            .toList(),
      );
}

class XcmV1_ReserveAssetDeposited extends XcmV1 {
  final List<MultiAssetV1> assets;
  final List<XcmOrderV1> effects;
  const XcmV1_ReserveAssetDeposited(
      {required this.assets, required this.effects})
      : super('ReserveAssetDeposited');

  static XcmV1_ReserveAssetDeposited fromMap(Map<String, dynamic> map) =>
      XcmV1_ReserveAssetDeposited(
        assets: (map['assets'] as List)
            .map((val) => MultiAssetV1.fromMap(val))
            .toList(),
        effects: (map['effects'] as List)
            .map((val) => XcmOrderV1.fromMap(val))
            .toList(),
      );
}

class XcmV1_ReceiveTeleportedAsset extends XcmV1 {
  final List<MultiAssetV1> assets;
  final List<XcmOrderV1> effects;
  const XcmV1_ReceiveTeleportedAsset(
      {required this.assets, required this.effects})
      : super('ReceiveTeleportedAsset');

  static XcmV1_ReceiveTeleportedAsset fromMap(Map<String, dynamic> map) =>
      XcmV1_ReceiveTeleportedAsset(
        assets: (map['assets'] as List)
            .map((val) => MultiAssetV1.fromMap(val))
            .toList(),
        effects: (map['effects'] as List)
            .map((val) => XcmOrderV1.fromMap(val))
            .toList(),
      );
}

class XcmV1_QueryResponse extends XcmV1 {
  final BigInt queryId;
  final XcmResponseV1 response;
  const XcmV1_QueryResponse({required this.queryId, required this.response})
      : super('QueryResponse');

  static XcmV1_QueryResponse fromMap(Map<String, dynamic> map) =>
      XcmV1_QueryResponse(
          queryId: parseBigInt(map['queryId']),
          response: XcmResponseV1.fromMap(map['response']));
}

class XcmV1_TransferAsset extends XcmV1 {
  final List<MultiAssetV1> assets;
  final MultiLocationV1 beneficiary;
  const XcmV1_TransferAsset({required this.assets, required this.beneficiary})
      : super('TransferAsset');

  static XcmV1_TransferAsset fromMap(Map<String, dynamic> map) =>
      XcmV1_TransferAsset(
          assets: (map['assets'] as List)
              .map((val) => MultiAssetV1.fromMap(val))
              .toList(),
          beneficiary: MultiLocationV1.fromMap(map['beneficiary']));
}

class XcmV1_TransferReserveAsset extends XcmV1 {
  final List<MultiAssetV1> assets;
  final MultiLocationV1 dest;
  final List<XcmOrderV1> effects;
  const XcmV1_TransferReserveAsset(
      {required this.assets, required this.dest, required this.effects})
      : super('TransferReserveAsset');

  static XcmV1_TransferReserveAsset fromMap(Map<String, dynamic> map) =>
      XcmV1_TransferReserveAsset(
        assets: (map['assets'] as List)
            .map((val) => MultiAssetV1.fromMap(val))
            .toList(),
        dest: MultiLocationV1.fromMap(map['dest']),
        effects: (map['effects'] as List)
            .map((val) => XcmOrderV1.fromMap(val))
            .toList(),
      );
}

class XcmV1_Transact extends XcmV1 {
  final XcmOriginKindV0 originType;
  final BigInt requireWeightAtMost;
  final Uint8List call;
  const XcmV1_Transact(
      {required this.originType,
      required this.requireWeightAtMost,
      required this.call})
      : super('Transact');

  static XcmV1_Transact fromMap(Map<String, dynamic> map) => XcmV1_Transact(
      originType: XcmOriginKindV0.fromMap(map['originType']),
      requireWeightAtMost: parseBigInt(map['requireWeightAtMost']),
      call: Uint8List.fromList((map['call'] as List).cast<int>()));
}

class XcmV1_HrmpNewChannelOpenRequest extends XcmV1 {
  final int sender;
  final int maxMessageSize;
  final int maxCapacity;
  const XcmV1_HrmpNewChannelOpenRequest(
      {required this.sender,
      required this.maxMessageSize,
      required this.maxCapacity})
      : super('HrmpNewChannelOpenRequest');

  static XcmV1_HrmpNewChannelOpenRequest fromMap(Map<String, dynamic> map) =>
      XcmV1_HrmpNewChannelOpenRequest(
          sender: map['sender'],
          maxMessageSize: map['maxMessageSize'],
          maxCapacity: map['maxCapacity']);
}

class XcmV1_HrmpChannelAccepted extends XcmV1 {
  final int recipient;
  const XcmV1_HrmpChannelAccepted({required this.recipient})
      : super('HrmpChannelAccepted');

  static XcmV1_HrmpChannelAccepted fromMap(Map<String, dynamic> map) =>
      XcmV1_HrmpChannelAccepted(recipient: map['recipient']);
}

class XcmV1_HrmpChannelClosing extends XcmV1 {
  final int initiator;
  final int sender;
  final int recipient;
  const XcmV1_HrmpChannelClosing(
      {required this.initiator, required this.sender, required this.recipient})
      : super('HrmpChannelClosing');

  static XcmV1_HrmpChannelClosing fromMap(Map<String, dynamic> map) =>
      XcmV1_HrmpChannelClosing(
          initiator: map['sender'],
          sender: map['maxMessageSize'],
          recipient: map['maxCapacity']);
}

class XcmV1_RelayedFrom extends XcmV1 {
  final MultiLocationV1 who;
  final XcmV1 message;
  const XcmV1_RelayedFrom({required this.who, required this.message})
      : super('RelayedFrom');

  static XcmV1_RelayedFrom fromMap(Map<String, dynamic> map) =>
      XcmV1_RelayedFrom(
          who: MultiLocationV1.fromMap(map['who']),
          message: XcmV1.fromMap(map['message']));
}

class XcmV1_SubscribeVersion extends XcmV1 {
  final BigInt queryId;
  final BigInt maxResponseWeight;
  const XcmV1_SubscribeVersion(
      {required this.queryId, required this.maxResponseWeight})
      : super('SubscribeVersion');

  static XcmV1_SubscribeVersion fromMap(Map<String, dynamic> map) =>
      XcmV1_SubscribeVersion(
          queryId: parseBigInt(map['queryId']),
          maxResponseWeight: parseBigInt(map['maxResponseWeight']));
}

class XcmV1_UnsubscribeVersion extends XcmV1 {
  const XcmV1_UnsubscribeVersion() : super('UnsubscribeVersion');
}
