part of xcm_models;

abstract class XcmErrorV1 {
  final String kind;
  const XcmErrorV1(this.kind);

  static XcmErrorV1 fromMap(Map<String, dynamic> map) {
    switch (map['__kind']) {
      case 'Undefined':
        return XcmErrorV1_Undefined();
      case 'Overflow':
        return XcmErrorV1_Overflow();
      case 'Unimplemented':
        return XcmErrorV1_Unimplemented();
      case 'UnhandledXcmVersion':
        return XcmErrorV1_UnhandledXcmVersion();
      case 'UnhandledXcmMessage':
        return XcmErrorV1_UnhandledXcmMessage();
      case 'UnhandledEffect':
        return XcmErrorV1_UnhandledEffect();
      case 'EscalationOfPrivilege':
        return XcmErrorV1_EscalationOfPrivilege();
      case 'UntrustedReserveLocation':
        return XcmErrorV1_UntrustedReserveLocation();
      case 'UntrustedTeleportLocation':
        return XcmErrorV1_UntrustedTeleportLocation();
      case 'DestinationBufferOverflow':
        return XcmErrorV1_DestinationBufferOverflow();
      case 'SendFailed':
        return XcmErrorV1_SendFailed();
      case 'CannotReachDestination':
        return XcmErrorV1_CannotReachDestination.fromMap(map);
      case 'MultiLocationFull':
        return XcmErrorV1_MultiLocationFull();
      case 'FailedToDecode':
        return XcmErrorV1_FailedToDecode();
      case 'BadOrigin':
        return XcmErrorV1_BadOrigin();
      case 'ExceedsMaxMessageSize':
        return XcmErrorV1_ExceedsMaxMessageSize();
      case 'FailedToTransactAsset':
        return XcmErrorV1_FailedToTransactAsset();
      case 'WeightLimitReached':
        return XcmErrorV1_WeightLimitReached.fromMap(map);
      case 'Wildcard':
        return XcmErrorV1_Wildcard();
      case 'TooMuchWeightRequired':
        return XcmErrorV1_TooMuchWeightRequired();
      case 'NotHoldingFees':
        return XcmErrorV1_NotHoldingFees();
      case 'WeightNotComputable':
        return XcmErrorV1_WeightNotComputable();
      case 'Barrier':
        return XcmErrorV1_Barrier();
      case 'NotWithdrawable':
        return XcmErrorV1_NotWithdrawable();
      case 'LocationCannotHold':
        return XcmErrorV1_LocationCannotHold();
      case 'TooExpensive':
        return XcmErrorV1_TooExpensive();
      case 'AssetNotFound':
        return XcmErrorV1_AssetNotFound();
      case 'DestinationUnsupported':
        return XcmErrorV1_DestinationUnsupported();
      case 'RecursionLimitReached':
        return XcmErrorV1_RecursionLimitReached();
      default:
        throw UnexpectedCaseException(map['__kind']);
    }
  }
}

class XcmErrorV1_Undefined extends XcmErrorV1 {
  const XcmErrorV1_Undefined() : super('Undefined');
}

class XcmErrorV1_Overflow extends XcmErrorV1 {
  const XcmErrorV1_Overflow() : super('Overflow');
}

class XcmErrorV1_Unimplemented extends XcmErrorV1 {
  const XcmErrorV1_Unimplemented() : super('Unimplemented');
}

class XcmErrorV1_UnhandledXcmVersion extends XcmErrorV1 {
  const XcmErrorV1_UnhandledXcmVersion() : super('UnhandledXcmVersion');
}

class XcmErrorV1_UnhandledXcmMessage extends XcmErrorV1 {
  const XcmErrorV1_UnhandledXcmMessage() : super('UnhandledXcmMessage');
}

class XcmErrorV1_UnhandledEffect extends XcmErrorV1 {
  const XcmErrorV1_UnhandledEffect() : super('UnhandledEffect');
}

class XcmErrorV1_EscalationOfPrivilege extends XcmErrorV1 {
  const XcmErrorV1_EscalationOfPrivilege() : super('EscalationOfPrivilege');
}

class XcmErrorV1_UntrustedReserveLocation extends XcmErrorV1 {
  const XcmErrorV1_UntrustedReserveLocation()
      : super('UntrustedReserveLocation');
}

class XcmErrorV1_UntrustedTeleportLocation extends XcmErrorV1 {
  const XcmErrorV1_UntrustedTeleportLocation()
      : super('UntrustedTeleportLocation');
}

class XcmErrorV1_DestinationBufferOverflow extends XcmErrorV1 {
  const XcmErrorV1_DestinationBufferOverflow()
      : super('DestinationBufferOverflow');
}

class XcmErrorV1_SendFailed extends XcmErrorV1 {
  const XcmErrorV1_SendFailed() : super('SendFailed');
}

class XcmErrorV1_CannotReachDestination extends XcmErrorV1 {
  /// [MultiLocationV1, XcmV1]
  final List<dynamic> value;
  XcmErrorV1_CannotReachDestination({required this.value})
      : super('CannotReachDestination') {
    assertionCheck(value.length <= 2, 'Max length 2 is allowed');
    assertionCheck(value.isEmpty || value[0] is MultiLocationV1,
        'MultiLocationV1 is allowed at index 0');
    assertionCheck(
        value.length != 2 || value[1] is XcmV1, 'XcmV1 is allowed at index 1');
  }

  static XcmErrorV1_CannotReachDestination fromMap(Map<String, dynamic> map) {
    final value = <dynamic>[];
    var list = map['value'];
    if (list is List && list.isNotEmpty) {
      value.add(MultiLocationV1.fromMap(list[0]));
      if (list.length > 1) {
        value.add(XcmV1.fromMap(list[1]));
      }
    }

    return XcmErrorV1_CannotReachDestination(value: value);
  }
}

class XcmErrorV1_MultiLocationFull extends XcmErrorV1 {
  const XcmErrorV1_MultiLocationFull() : super('MultiLocationFull');
}

class XcmErrorV1_FailedToDecode extends XcmErrorV1 {
  const XcmErrorV1_FailedToDecode() : super('FailedToDecode');
}

class XcmErrorV1_BadOrigin extends XcmErrorV1 {
  const XcmErrorV1_BadOrigin() : super('BadOrigin');
}

class XcmErrorV1_ExceedsMaxMessageSize extends XcmErrorV1 {
  const XcmErrorV1_ExceedsMaxMessageSize() : super('ExceedsMaxMessageSize');
}

class XcmErrorV1_FailedToTransactAsset extends XcmErrorV1 {
  const XcmErrorV1_FailedToTransactAsset() : super('FailedToTransactAsset');
}

class XcmErrorV1_WeightLimitReached extends XcmErrorV1 {
  final BigInt value;
  const XcmErrorV1_WeightLimitReached({required this.value})
      : super('WeightLimitReached');

  static XcmErrorV1_WeightLimitReached fromMap(Map<String, dynamic> map) =>
      XcmErrorV1_WeightLimitReached(value: parseBigInt(map['value']));
}

class XcmErrorV1_Wildcard extends XcmErrorV1 {
  const XcmErrorV1_Wildcard() : super('Wildcard');
}

class XcmErrorV1_TooMuchWeightRequired extends XcmErrorV1 {
  const XcmErrorV1_TooMuchWeightRequired() : super('TooMuchWeightRequired');
}

class XcmErrorV1_NotHoldingFees extends XcmErrorV1 {
  const XcmErrorV1_NotHoldingFees() : super('NotHoldingFees');
}

class XcmErrorV1_WeightNotComputable extends XcmErrorV1 {
  const XcmErrorV1_WeightNotComputable() : super('WeightNotComputable');
}

class XcmErrorV1_Barrier extends XcmErrorV1 {
  const XcmErrorV1_Barrier() : super('Barrier');
}

class XcmErrorV1_NotWithdrawable extends XcmErrorV1 {
  const XcmErrorV1_NotWithdrawable() : super('NotWithdrawable');
}

class XcmErrorV1_LocationCannotHold extends XcmErrorV1 {
  const XcmErrorV1_LocationCannotHold() : super('LocationCannotHold');
}

class XcmErrorV1_TooExpensive extends XcmErrorV1 {
  const XcmErrorV1_TooExpensive() : super('TooExpensive');
}

class XcmErrorV1_AssetNotFound extends XcmErrorV1 {
  const XcmErrorV1_AssetNotFound() : super('AssetNotFound');
}

class XcmErrorV1_DestinationUnsupported extends XcmErrorV1 {
  const XcmErrorV1_DestinationUnsupported() : super('DestinationUnsupported');
}

class XcmErrorV1_RecursionLimitReached extends XcmErrorV1 {
  const XcmErrorV1_RecursionLimitReached() : super('RecursionLimitReached');
}
