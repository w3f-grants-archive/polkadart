part of xcm_models;

abstract class XcmOutcomeV0 {
  final String kind;
  const XcmOutcomeV0(this.kind);

  static XcmOutcomeV0 fromMap(Map<String, dynamic> map) {
    switch (map['__kind']) {
      case 'Complete':
        return XcmOutcomeV0_Complete.fromMap(map);
      case 'Incomplete':
        return XcmOutcomeV0_Incomplete.fromMap(map);
      case 'Error':
        return XcmOutcomeV0_Error.fromMap(map);
      default:
        throw UnexpectedCaseException(map['__kind']);
    }
  }
}

class XcmOutcomeV0_Complete extends XcmOutcomeV0 {
  final BigInt value;

  const XcmOutcomeV0_Complete({required this.value}) : super('Complete');

  static XcmOutcomeV0_Complete fromMap(Map<String, dynamic> map) =>
      XcmOutcomeV0_Complete(value: parseBigInt(map['value']));
}

class XcmOutcomeV0_Incomplete extends XcmOutcomeV0 {
  /// [bigint, XcmErrorV0]
  final List<dynamic> value;
  XcmOutcomeV0_Incomplete({required this.value}) : super('Incomplete') {
    assertionCheck(value.length <= 2, 'Max length 2 is allowed');
    assertionCheck(
        value.isEmpty || value[0] is BigInt, 'BigInt is allowed at index 0');
    assertionCheck(value.length != 2 || value[1] is XcmErrorV0,
        'XcmErrorV0 is allowed at index 1');
  }

  static XcmOutcomeV0_Incomplete fromMap(Map<String, dynamic> map) {
    final value = <dynamic>[];
    var list = map['value'];
    if (list is List && list.isNotEmpty) {
      value.add(parseBigInt(list[0]));
      if (list.length == 2) {
        value.add(XcmErrorV0.fromMap(list[1]));
      }
    }

    return XcmOutcomeV0_Incomplete(value: value);
  }
}

class XcmOutcomeV0_Error extends XcmOutcomeV0 {
  final XcmErrorV0 value;

  const XcmOutcomeV0_Error({required this.value}) : super('Error');

  static XcmOutcomeV0_Error fromMap(Map<String, dynamic> map) =>
      XcmOutcomeV0_Error(value: XcmErrorV0.fromMap(map['value']));
}
