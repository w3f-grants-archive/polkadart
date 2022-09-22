part of xcm_models;

abstract class XcmV0 {
  final String kind;
  const XcmV0(this.kind);

  static XcmV0 fromMap(Map<String, dynamic> map) {
    switch (map['__kind']) {
      case 'WithdrawAsset':
        return XcmV0_WithdrawAsset.fromMap(map);
      case 'ReserveAssetDeposit':
        return XcmV0_ReserveAssetDeposit.fromMap(map);
      case 'TeleportAsset':
        return XcmV0_TeleportAsset.fromMap(map);
      case 'QueryResponse':
        return XcmV0_QueryResponse.fromMap(map);
      case 'TransferAsset':
        return XcmV0_TransferAsset.fromMap(map);
      case 'TransferReserveAsset':
        return XcmV0_TransferReserveAsset.fromMap(map);
      case 'Transact':
        return XcmV0_Transact.fromMap(map);
      case 'HrmpNewChannelOpenRequest':
        return XcmV0_HrmpNewChannelOpenRequest.fromMap(map);
      case 'HrmpChannelAccepted':
        return XcmV0_HrmpChannelAccepted.fromMap(map);
      case 'HrmpChannelClosing':
        return XcmV0_HrmpChannelClosing.fromMap(map);
      case 'RelayedFrom':
        return XcmV0_RelayedFrom.fromMap(map);
      default:
        throw UnexpectedCaseException();
    }
  }
}

class XcmV0_WithdrawAsset extends XcmV0 {
  final List<MultiAssetV0> assets;
  final List<XcmOrderV0> effects;
  const XcmV0_WithdrawAsset({required this.assets, required this.effects})
      : super('WithdrawAsset');

  static XcmV0_WithdrawAsset fromMap(Map<String, dynamic> map) =>
      XcmV0_WithdrawAsset(
        assets: (map['assets'] as List)
            .map((val) => MultiAssetV0.fromMap(val))
            .toList(),
        effects: (map['effects'] as List)
            .map((val) => XcmOrderV0.fromMap(val))
            .toList(),
      );
}

class XcmV0_ReserveAssetDeposit extends XcmV0 {
  final List<MultiAssetV0> assets;
  final List<XcmOrderV0> effects;
  const XcmV0_ReserveAssetDeposit({required this.assets, required this.effects})
      : super('ReserveAssetDeposit');

  static XcmV0_ReserveAssetDeposit fromMap(Map<String, dynamic> map) =>
      XcmV0_ReserveAssetDeposit(
        assets: (map['assets'] as List)
            .map((val) => MultiAssetV0.fromMap(val))
            .toList(),
        effects: (map['effects'] as List)
            .map((val) => XcmOrderV0.fromMap(val))
            .toList(),
      );
}

class XcmV0_TeleportAsset extends XcmV0 {
  final List<MultiAssetV0> assets;
  final List<XcmOrderV0> effects;
  const XcmV0_TeleportAsset({required this.assets, required this.effects})
      : super('TeleportAsset');

  static XcmV0_TeleportAsset fromMap(Map<String, dynamic> map) =>
      XcmV0_TeleportAsset(
        assets: (map['assets'] as List)
            .map((val) => MultiAssetV0.fromMap(val))
            .toList(),
        effects: (map['effects'] as List)
            .map((val) => XcmOrderV0.fromMap(val))
            .toList(),
      );
}

class XcmV0_QueryResponse extends XcmV0 {
  final BigInt queryId;
  final XcmResponseV0 response;
  const XcmV0_QueryResponse({required this.queryId, required this.response})
      : super('QueryResponse');

  static XcmV0_QueryResponse fromMap(Map<String, dynamic> map) =>
      XcmV0_QueryResponse(
        queryId: parseBigInt(map['queryId']),
        response: XcmResponseV0.fromMap(map['response']),
      );
}

class XcmV0_TransferAsset extends XcmV0 {
  final List<MultiAssetV0> assets;
  final MultiLocationV0 dest;
  const XcmV0_TransferAsset({required this.assets, required this.dest})
      : super('TransferAsset');

  static XcmV0_TransferAsset fromMap(Map<String, dynamic> map) =>
      XcmV0_TransferAsset(
          assets: (map['assets'] as List)
              .map((val) => MultiAssetV0.fromMap(val))
              .toList(),
          dest: MultiLocationV0.fromMap(map['dest']));
}

class XcmV0_TransferReserveAsset extends XcmV0 {
  final List<MultiAssetV0> assets;
  final MultiLocationV0 dest;
  final List<XcmOrderV0> effects;
  const XcmV0_TransferReserveAsset(
      {required this.assets, required this.dest, required this.effects})
      : super('TransferReserveAsset');

  static XcmV0_TransferReserveAsset fromMap(Map<String, dynamic> map) =>
      XcmV0_TransferReserveAsset(
        assets: (map['assets'] as List)
            .map((val) => MultiAssetV0.fromMap(val))
            .toList(),
        dest: MultiLocationV0.fromMap(map['dest']),
        effects: (map['effects'] as List)
            .map((val) => XcmOrderV0.fromMap(val))
            .toList(),
      );
}

class XcmV0_Transact extends XcmV0 {
  final XcmOriginKindV0 originType;
  final BigInt requireWeightAtMost;
  final Uint8List call;
  const XcmV0_Transact(
      {required this.originType,
      required this.requireWeightAtMost,
      required this.call})
      : super('Transact');

  static XcmV0_Transact fromMap(Map<String, dynamic> map) => XcmV0_Transact(
      originType: XcmOriginKindV0.fromMap(map['originType']),
      requireWeightAtMost: parseBigInt(map['requireWeightAtMost']),
      call: Uint8List.fromList((map['call'] as List).cast<int>()));
}

class XcmV0_HrmpNewChannelOpenRequest extends XcmV0 {
  final int sender;
  final int maxMessageSize;
  final int maxCapacity;
  const XcmV0_HrmpNewChannelOpenRequest(
      {required this.sender,
      required this.maxMessageSize,
      required this.maxCapacity})
      : super('HrmpNewChannelOpenRequest');

  static XcmV0_HrmpNewChannelOpenRequest fromMap(Map<String, dynamic> map) =>
      XcmV0_HrmpNewChannelOpenRequest(
          sender: map['sender'],
          maxMessageSize: map['maxMessageSize'],
          maxCapacity: map['maxCapacity']);
}

class XcmV0_HrmpChannelAccepted extends XcmV0 {
  final int recipient;
  const XcmV0_HrmpChannelAccepted({required this.recipient})
      : super('HrmpChannelAccepted');

  static XcmV0_HrmpChannelAccepted fromMap(Map<String, dynamic> map) =>
      XcmV0_HrmpChannelAccepted(recipient: map['recipient']);
}

class XcmV0_HrmpChannelClosing extends XcmV0 {
  final int initiator;
  final int sender;
  final int recipient;
  const XcmV0_HrmpChannelClosing({
    required this.initiator,
    required this.sender,
    required this.recipient,
  }) : super('HrmpChannelClosing');

  static XcmV0_HrmpChannelClosing fromMap(Map<String, dynamic> map) =>
      XcmV0_HrmpChannelClosing(
          initiator: map['initiator'],
          sender: map['sender'],
          recipient: map['recipient']);
}

class XcmV0_RelayedFrom extends XcmV0 {
  final MultiLocationV0 who;
  final XcmV0 message;
  const XcmV0_RelayedFrom({required this.who, required this.message})
      : super('RelayedFrom');

  static XcmV0_RelayedFrom fromMap(Map<String, dynamic> map) =>
      XcmV0_RelayedFrom(
          who: MultiLocationV0.fromMap(map['who']), message: map['message']);
}
