part of xcm_models;

abstract class XcmErrorV2 {
  final String kind;
  const XcmErrorV2(this.kind);

  static XcmErrorV2 fromMap(Map<String, dynamic> map) {
    switch (map['__kind']) {
      case 'Undefined':
        return XcmErrorV2_Undefined();
      case 'Overflow':
        return XcmErrorV2_Overflow();
      case 'Unimplemented':
        return XcmErrorV2_Unimplemented();
      case 'UnhandledXcmVersion':
        return XcmErrorV2_UnhandledXcmVersion();
      case 'UnhandledXcmMessage':
        return XcmErrorV2_UnhandledXcmMessage();
      case 'UnhandledEffect':
        return XcmErrorV2_UnhandledEffect();
      case 'EscalationOfPrivilege':
        return XcmErrorV2_EscalationOfPrivilege();
      case 'UntrustedReserveLocation':
        return XcmErrorV2_UntrustedReserveLocation();
      case 'UntrustedTeleportLocation':
        return XcmErrorV2_UntrustedTeleportLocation();
      case 'DestinationBufferOverflow':
        return XcmErrorV2_DestinationBufferOverflow();
      case 'MultiLocationFull':
        return XcmErrorV2_MultiLocationFull();
      case 'MultiLocationNotInvertible':
        return XcmErrorV2_MultiLocationNotInvertible();
      case 'FailedToDecode':
        return XcmErrorV2_FailedToDecode();
      case 'BadOrigin':
        return XcmErrorV2_BadOrigin();
      case 'ExceedsMaxMessageSize':
        return XcmErrorV2_ExceedsMaxMessageSize();
      case 'FailedToTransactAsset':
        return XcmErrorV2_FailedToTransactAsset();
      case 'WeightLimitReached':
        return XcmErrorV2_WeightLimitReached.fromMap(map);
      case 'Wildcard':
        return XcmErrorV2_Wildcard();
      case 'TooMuchWeightRequired':
        return XcmErrorV2_TooMuchWeightRequired();
      case 'NotHoldingFees':
        return XcmErrorV2_NotHoldingFees();
      case 'WeightNotComputable':
        return XcmErrorV2_WeightNotComputable();
      case 'Barrier':
        return XcmErrorV2_Barrier();
      case 'NotWithdrawable':
        return XcmErrorV2_NotWithdrawable();
      case 'LocationCannotHold':
        return XcmErrorV2_LocationCannotHold();
      case 'TooExpensive':
        return XcmErrorV2_TooExpensive();
      case 'AssetNotFound':
        return XcmErrorV2_AssetNotFound();
      case 'DestinationUnsupported':
        return XcmErrorV2_DestinationUnsupported();
      case 'RecursionLimitReached':
        return XcmErrorV2_RecursionLimitReached();
      case 'Transport':
        return XcmErrorV2_Transport();
      case 'Unroutable':
        return XcmErrorV2_Unroutable();
      case 'UnknownWeightRequired':
        return XcmErrorV2_UnknownWeightRequired();
      case 'Trap':
        return XcmErrorV2_Trap.fromMap(map);
      case 'UnknownClaim':
        return XcmErrorV2_UnknownClaim();
      case 'InvalidLocation':
        return XcmErrorV2_InvalidLocation();
      default:
        throw UnexpectedCaseException(map['__kind']);
    }
  }
}

class XcmErrorV2_Undefined extends XcmErrorV2 {
  const XcmErrorV2_Undefined() : super('Undefined');
}

class XcmErrorV2_Overflow extends XcmErrorV2 {
  const XcmErrorV2_Overflow() : super('Overflow');
}

class XcmErrorV2_Unimplemented extends XcmErrorV2 {
  const XcmErrorV2_Unimplemented() : super('Unimplemented');
}

class XcmErrorV2_UnhandledXcmVersion extends XcmErrorV2 {
  const XcmErrorV2_UnhandledXcmVersion() : super('UnhandledXcmVersion');
}

class XcmErrorV2_UnhandledXcmMessage extends XcmErrorV2 {
  const XcmErrorV2_UnhandledXcmMessage() : super('UnhandledXcmMessage');
}

class XcmErrorV2_UnhandledEffect extends XcmErrorV2 {
  const XcmErrorV2_UnhandledEffect() : super('UnhandledEffect');
}

class XcmErrorV2_EscalationOfPrivilege extends XcmErrorV2 {
  const XcmErrorV2_EscalationOfPrivilege() : super('EscalationOfPrivilege');
}

class XcmErrorV2_UntrustedReserveLocation extends XcmErrorV2 {
  const XcmErrorV2_UntrustedReserveLocation()
      : super('UntrustedReserveLocation');
}

class XcmErrorV2_UntrustedTeleportLocation extends XcmErrorV2 {
  const XcmErrorV2_UntrustedTeleportLocation()
      : super('UntrustedTeleportLocation');
}

class XcmErrorV2_DestinationBufferOverflow extends XcmErrorV2 {
  const XcmErrorV2_DestinationBufferOverflow()
      : super('DestinationBufferOverflow');
}

class XcmErrorV2_MultiLocationFull extends XcmErrorV2 {
  const XcmErrorV2_MultiLocationFull() : super('MultiLocationFull');
}

class XcmErrorV2_MultiLocationNotInvertible extends XcmErrorV2 {
  const XcmErrorV2_MultiLocationNotInvertible()
      : super('MultiLocationNotInvertible');
}

class XcmErrorV2_FailedToDecode extends XcmErrorV2 {
  const XcmErrorV2_FailedToDecode() : super('FailedToDecode');
}

class XcmErrorV2_BadOrigin extends XcmErrorV2 {
  const XcmErrorV2_BadOrigin() : super('BadOrigin');
}

class XcmErrorV2_ExceedsMaxMessageSize extends XcmErrorV2 {
  const XcmErrorV2_ExceedsMaxMessageSize() : super('ExceedsMaxMessageSize');
}

class XcmErrorV2_FailedToTransactAsset extends XcmErrorV2 {
  const XcmErrorV2_FailedToTransactAsset() : super('FailedToTransactAsset');
}

class XcmErrorV2_WeightLimitReached extends XcmErrorV2 {
  final BigInt value;
  const XcmErrorV2_WeightLimitReached({required this.value})
      : super('WeightLimitReached');

  static XcmErrorV2_WeightLimitReached fromMap(Map<String, dynamic> map) =>
      XcmErrorV2_WeightLimitReached(value: parseBigInt(map['value']));
}

class XcmErrorV2_Wildcard extends XcmErrorV2 {
  const XcmErrorV2_Wildcard() : super('Wildcard');
}

class XcmErrorV2_TooMuchWeightRequired extends XcmErrorV2 {
  const XcmErrorV2_TooMuchWeightRequired() : super('TooMuchWeightRequired');
}

class XcmErrorV2_NotHoldingFees extends XcmErrorV2 {
  const XcmErrorV2_NotHoldingFees() : super('NotHoldingFees');
}

class XcmErrorV2_WeightNotComputable extends XcmErrorV2 {
  const XcmErrorV2_WeightNotComputable() : super('WeightNotComputable');
}

class XcmErrorV2_Barrier extends XcmErrorV2 {
  const XcmErrorV2_Barrier() : super('Barrier');
}

class XcmErrorV2_NotWithdrawable extends XcmErrorV2 {
  const XcmErrorV2_NotWithdrawable() : super('NotWithdrawable');
}

class XcmErrorV2_LocationCannotHold extends XcmErrorV2 {
  const XcmErrorV2_LocationCannotHold() : super('LocationCannotHold');
}

class XcmErrorV2_TooExpensive extends XcmErrorV2 {
  const XcmErrorV2_TooExpensive() : super('TooExpensive');
}

class XcmErrorV2_AssetNotFound extends XcmErrorV2 {
  const XcmErrorV2_AssetNotFound() : super('AssetNotFound');
}

class XcmErrorV2_DestinationUnsupported extends XcmErrorV2 {
  const XcmErrorV2_DestinationUnsupported() : super('DestinationUnsupported');
}

class XcmErrorV2_RecursionLimitReached extends XcmErrorV2 {
  const XcmErrorV2_RecursionLimitReached() : super('RecursionLimitReached');
}

class XcmErrorV2_Transport extends XcmErrorV2 {
  const XcmErrorV2_Transport() : super('Transport');
}

class XcmErrorV2_Unroutable extends XcmErrorV2 {
  const XcmErrorV2_Unroutable() : super('Unroutable');
}

class XcmErrorV2_UnknownWeightRequired extends XcmErrorV2 {
  const XcmErrorV2_UnknownWeightRequired() : super('UnknownWeightRequired');
}

class XcmErrorV2_Trap extends XcmErrorV2 {
  final BigInt value;
  const XcmErrorV2_Trap({required this.value}) : super('Trap');

  static XcmErrorV2_Trap fromMap(Map<String, dynamic> map) =>
      XcmErrorV2_Trap(value: parseBigInt(map['value']));
}

class XcmErrorV2_UnknownClaim extends XcmErrorV2 {
  const XcmErrorV2_UnknownClaim() : super('UnknownClaim');
}

class XcmErrorV2_InvalidLocation extends XcmErrorV2 {
  const XcmErrorV2_InvalidLocation() : super('InvalidLocation');
}
