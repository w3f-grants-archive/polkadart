part of xcm_models;

abstract class XcmBodyPartV0 {
  final String kind;
  const XcmBodyPartV0(this.kind);

  /// Construct Object from Json
  static XcmBodyPartV0 fromMap(Map<String, dynamic> map) {
    switch (map['__kind']) {
      case 'Voice':
        return XcmBodyPartV0_Voice();
      case 'Members':
        return XcmBodyPartV0_Members.fromMap(map);
      case 'Fraction':
        return XcmBodyPartV0_Fraction.fromMap(map);
      case 'AtLeastProportion':
        return XcmBodyPartV0_AtLeastProportion.fromMap(map);
      case 'MoreThanProportion':
        return XcmBodyPartV0_MoreThanProportion.fromMap(map);
      default:
        throw UnexpectedCaseException(map['__kind']);
    }
  }
}

class XcmBodyPartV0_Voice extends XcmBodyPartV0 {
  const XcmBodyPartV0_Voice() : super('Voice');
}

class XcmBodyPartV0_Members extends XcmBodyPartV0 {
  final int value;
  const XcmBodyPartV0_Members({required this.value}) : super('Members');

  /// Construct Object from Json
  static XcmBodyPartV0_Members fromMap(Map<String, dynamic> map) =>
      XcmBodyPartV0_Members(value: map['value']);
}

class XcmBodyPartV0_Fraction extends XcmBodyPartV0 {
  final int nom;
  final int denom;
  const XcmBodyPartV0_Fraction({required this.nom, required this.denom})
      : super('Fraction');

  /// Construct Object from Json
  static XcmBodyPartV0_Fraction fromMap(Map<String, dynamic> map) =>
      XcmBodyPartV0_Fraction(nom: map['nom'], denom: map['denom']);
}

class XcmBodyPartV0_AtLeastProportion extends XcmBodyPartV0 {
  final int nom;
  final int denom;
  const XcmBodyPartV0_AtLeastProportion(
      {required this.nom, required this.denom})
      : super('AtLeastProportion');

  /// Construct Object from Json
  static XcmBodyPartV0_AtLeastProportion fromMap(Map<String, dynamic> map) =>
      XcmBodyPartV0_AtLeastProportion(nom: map['nom'], denom: map['denom']);
}

class XcmBodyPartV0_MoreThanProportion extends XcmBodyPartV0 {
  final int nom;
  final int denom;
  const XcmBodyPartV0_MoreThanProportion(
      {required this.nom, required this.denom})
      : super('MoreThanProportion');

  /// Construct Object from Json
  static XcmBodyPartV0_MoreThanProportion fromMap(Map<String, dynamic> map) =>
      XcmBodyPartV0_MoreThanProportion(nom: map['nom'], denom: map['denom']);
}
