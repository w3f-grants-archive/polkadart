part of xcm_models;

abstract class XcmOriginKindV0 {
  final String kind;
  const XcmOriginKindV0(this.kind);

  static XcmOriginKindV0 fromMap(Map<String, dynamic> map) {
    switch (map['__kind']) {
      case 'Native':
        return XcmOriginKindV0_Native();
      case 'SovereignAccount':
        return XcmOriginKindV0_SovereignAccount();
      case 'Superuser':
        return XcmOriginKindV0_Superuser();
      case 'Xcm':
        return XcmOriginKindV0_Xcm();
      default:
        throw UnexpectedCaseException(map['__kind']);
    }
  }
}

class XcmOriginKindV0_Native extends XcmOriginKindV0 {
  const XcmOriginKindV0_Native() : super('Native');
}

class XcmOriginKindV0_SovereignAccount extends XcmOriginKindV0 {
  const XcmOriginKindV0_SovereignAccount() : super('SovereignAccount');
}

class XcmOriginKindV0_Superuser extends XcmOriginKindV0 {
  const XcmOriginKindV0_Superuser() : super('Superuser');
}

class XcmOriginKindV0_Xcm extends XcmOriginKindV0 {
  const XcmOriginKindV0_Xcm() : super('Xcm');
}
