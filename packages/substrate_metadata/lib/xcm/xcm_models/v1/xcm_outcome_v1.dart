part of xcm_models;

abstract class XcmOutcomeV1 {
  final String kind;

  const XcmOutcomeV1(this.kind);

  static XcmOutcomeV1 fromMap(Map<String, dynamic> map) {
    switch (map['__kind']) {
      case 'Complete':
        return XcmOutcomeV1_Complete.fromMap(map);
      case 'Incomplete':
        return XcmOutcomeV1_Incomplete.fromMap(map);
      case 'Error':
        return XcmOutcomeV1_Error.fromMap(map);
      default:
        throw UnexpectedCaseException(map['__kind']);
    }
  }
}

class XcmOutcomeV1_Complete extends XcmOutcomeV1 {
  final BigInt value;
  const XcmOutcomeV1_Complete({required this.value}) : super('Complete');

  static XcmOutcomeV1_Complete fromMap(Map<String, dynamic> map) =>
      XcmOutcomeV1_Complete(value: parseBigInt(map['value']));
}

class XcmOutcomeV1_Incomplete extends XcmOutcomeV1 {
  /// [BigInt, XcmErrorV2]
  final List<dynamic> value;
  XcmOutcomeV1_Incomplete({required this.value}) : super('Incomplete') {
    assertionCheck(value.length <= 2, 'Max length 2 is allowed');
    assertionCheck(
        value.isEmpty || value[0] is BigInt, 'BigInt is allowed at index 0');
    assertionCheck(value.length != 2 || value[1] is XcmErrorV2,
        'XcmErrorV2 is allowed at index 1');
  }

  static XcmOutcomeV1_Incomplete fromMap(Map<String, dynamic> map) {
    final value = <dynamic>[];
    var list = map['value'];
    if (list is List && list.isNotEmpty) {
      value.add(parseBigInt(list[0]));
      if (list.length > 1) {
        value.add(XcmErrorV2.fromMap(list[1]));
      }
    }
    return XcmOutcomeV1_Incomplete(value: value);
  }
}

class XcmOutcomeV1_Error extends XcmOutcomeV1 {
  final XcmErrorV2 value;
  const XcmOutcomeV1_Error({required this.value}) : super('Error');

  static XcmOutcomeV1_Error fromMap(Map<String, dynamic> map) =>
      XcmOutcomeV1_Error(value: XcmErrorV2.fromMap(map['value']));
}
