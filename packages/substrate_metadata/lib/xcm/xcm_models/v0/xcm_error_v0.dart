part of xcm_models;

abstract class XcmErrorV0 {
  final String kind;
  const XcmErrorV0(this.kind);

  static XcmErrorV0 fromMap(Map<String, dynamic> map) {
    switch (map['__kind']) {
      case 'Undefined':
        return XcmErrorV0_Undefined();
      case 'Overflow':
        return XcmErrorV0_Overflow();
      case 'Unimplemented':
        return XcmErrorV0_Unimplemented();
      case 'UnhandledXcmVersion':
        return XcmErrorV0_UnhandledXcmVersion();
      case 'UnhandledXcmMessage':
        return XcmErrorV0_UnhandledXcmMessage();
      case 'UnhandledEffect':
        return XcmErrorV0_UnhandledEffect();
      case 'EscalationOfPrivilege':
        return XcmErrorV0_EscalationOfPrivilege();
      case 'UntrustedReserveLocation':
        return XcmErrorV0_UntrustedReserveLocation();
      case 'UntrustedTeleportLocation':
        return XcmErrorV0_UntrustedTeleportLocation();
      case 'DestinationBufferOverflow':
        return XcmErrorV0_DestinationBufferOverflow();
      case 'SendFailed':
        return XcmErrorV0_SendFailed();
      case 'CannotReachDestination':
        return XcmErrorV0_CannotReachDestination.fromMap(map);
      case 'MultiLocationFull':
        return XcmErrorV0_MultiLocationFull();
      case 'FailedToDecode':
        return XcmErrorV0_FailedToDecode();
      case 'BadOrigin':
        return XcmErrorV0_BadOrigin();
      case 'ExceedsMaxMessageSize':
        return XcmErrorV0_ExceedsMaxMessageSize();
      case 'FailedToTransactAsset':
        return XcmErrorV0_FailedToTransactAsset();
      case 'WeightLimitReached':
        return XcmErrorV0_WeightLimitReached.fromMap(map);
      case 'Wildcard':
        return XcmErrorV0_Wildcard();
      case 'TooMuchWeightRequired':
        return XcmErrorV0_TooMuchWeightRequired();
      case 'NotHoldingFees':
        return XcmErrorV0_NotHoldingFees();
      case 'WeightNotComputable':
        return XcmErrorV0_WeightNotComputable();
      case 'Barrier':
        return XcmErrorV0_Barrier();
      case 'NotWithdrawable':
        return XcmErrorV0_NotWithdrawable();
      case 'LocationCannotHold':
        return XcmErrorV0_LocationCannotHold();
      case 'TooExpensive':
        return XcmErrorV0_TooExpensive();
      case 'AssetNotFound':
        return XcmErrorV0_AssetNotFound();
      case 'RecursionLimitReached':
        return XcmErrorV0_RecursionLimitReached();
      default:
        throw UnexpectedCaseException();
    }
  }
}

class XcmErrorV0_Undefined extends XcmErrorV0 {
  const XcmErrorV0_Undefined() : super('Undefined');
}

class XcmErrorV0_Overflow extends XcmErrorV0 {
  const XcmErrorV0_Overflow() : super('Overflow');
}

class XcmErrorV0_Unimplemented extends XcmErrorV0 {
  const XcmErrorV0_Unimplemented() : super('Unimplemented');
}

class XcmErrorV0_UnhandledXcmVersion extends XcmErrorV0 {
  const XcmErrorV0_UnhandledXcmVersion() : super('UnhandledXcmVersion');
}

class XcmErrorV0_UnhandledXcmMessage extends XcmErrorV0 {
  const XcmErrorV0_UnhandledXcmMessage() : super('UnhandledXcmMessage');
}

class XcmErrorV0_UnhandledEffect extends XcmErrorV0 {
  const XcmErrorV0_UnhandledEffect() : super('UnhandledEffect');
}

class XcmErrorV0_EscalationOfPrivilege extends XcmErrorV0 {
  const XcmErrorV0_EscalationOfPrivilege() : super('EscalationOfPrivilege');
}

class XcmErrorV0_UntrustedReserveLocation extends XcmErrorV0 {
  const XcmErrorV0_UntrustedReserveLocation()
      : super('UntrustedReserveLocation');
}

class XcmErrorV0_UntrustedTeleportLocation extends XcmErrorV0 {
  const XcmErrorV0_UntrustedTeleportLocation()
      : super('UntrustedTeleportLocation');
}

class XcmErrorV0_DestinationBufferOverflow extends XcmErrorV0 {
  const XcmErrorV0_DestinationBufferOverflow()
      : super('DestinationBufferOverflow');
}

class XcmErrorV0_SendFailed extends XcmErrorV0 {
  const XcmErrorV0_SendFailed() : super('SendFailed');
}

class XcmErrorV0_CannotReachDestination extends XcmErrorV0 {
  /// [ MultiLocationV0, XcmV0 ]
  final List<dynamic> value;
  XcmErrorV0_CannotReachDestination({required this.value})
      : super('CannotReachDestination') {
    assertionCheck(value.length <= 2, 'Max length 2 is allowed');
    assertionCheck(value.isEmpty || value[0] is MultiLocationV0,
        'MultiLocationV0 is allowed at index 0');
    assertionCheck(
        value.length != 2 || value[1] is XcmV0, 'XcmV0 is allowed at index 0');
  }

  static XcmErrorV0_CannotReachDestination fromMap(Map<String, dynamic> map) {
    final value = <dynamic>[];
    var list = map['value'];
    if (list is List && list.isNotEmpty) {
      value.add(MultiLocationV0.fromMap(list[0]));
      if (list.length == 2) {
        value.add(XcmV0.fromMap(list[0]));
      }
    }

    return XcmErrorV0_CannotReachDestination(value: value);
  }
}

class XcmErrorV0_MultiLocationFull extends XcmErrorV0 {
  const XcmErrorV0_MultiLocationFull() : super('MultiLocationFull');
}

class XcmErrorV0_FailedToDecode extends XcmErrorV0 {
  const XcmErrorV0_FailedToDecode() : super('FailedToDecode');
}

class XcmErrorV0_BadOrigin extends XcmErrorV0 {
  const XcmErrorV0_BadOrigin() : super('BadOrigin');
}

class XcmErrorV0_ExceedsMaxMessageSize extends XcmErrorV0 {
  const XcmErrorV0_ExceedsMaxMessageSize() : super('ExceedsMaxMessageSize');
}

class XcmErrorV0_FailedToTransactAsset extends XcmErrorV0 {
  const XcmErrorV0_FailedToTransactAsset() : super('FailedToTransactAsset');
}

class XcmErrorV0_WeightLimitReached extends XcmErrorV0 {
  final BigInt value;
  const XcmErrorV0_WeightLimitReached({required this.value})
      : super('WeightLimitReached');

  static XcmErrorV0_WeightLimitReached fromMap(Map<String, dynamic> map) =>
      XcmErrorV0_WeightLimitReached(value: parseBigInt(map['value']));
}

class XcmErrorV0_Wildcard extends XcmErrorV0 {
  const XcmErrorV0_Wildcard() : super('Wildcard');
}

class XcmErrorV0_TooMuchWeightRequired extends XcmErrorV0 {
  const XcmErrorV0_TooMuchWeightRequired() : super('TooMuchWeightRequired');
}

class XcmErrorV0_NotHoldingFees extends XcmErrorV0 {
  const XcmErrorV0_NotHoldingFees() : super('NotHoldingFees');
}

class XcmErrorV0_WeightNotComputable extends XcmErrorV0 {
  const XcmErrorV0_WeightNotComputable() : super('WeightNotComputable');
}

class XcmErrorV0_Barrier extends XcmErrorV0 {
  const XcmErrorV0_Barrier() : super('Barrier');
}

class XcmErrorV0_NotWithdrawable extends XcmErrorV0 {
  const XcmErrorV0_NotWithdrawable() : super('NotWithdrawable');
}

class XcmErrorV0_LocationCannotHold extends XcmErrorV0 {
  const XcmErrorV0_LocationCannotHold() : super('LocationCannotHold');
}

class XcmErrorV0_TooExpensive extends XcmErrorV0 {
  const XcmErrorV0_TooExpensive() : super('TooExpensive');
}

class XcmErrorV0_AssetNotFound extends XcmErrorV0 {
  const XcmErrorV0_AssetNotFound() : super('AssetNotFound');
}

class XcmErrorV0_RecursionLimitReached extends XcmErrorV0 {
  const XcmErrorV0_RecursionLimitReached() : super('RecursionLimitReached');
}
