part of xcm_models;

abstract class XcmResponseV2 {
  final String kind;
  const XcmResponseV2(this.kind);

  static XcmResponseV2 fromMap(Map<String, dynamic> map) {
    switch (map['__kind']) {
      case 'Null':
        return XcmResponseV2_Null();
      case 'Assets':
        return XcmResponseV2_Assets.fromMap(map);
      case 'ExecutionResult':
        return XcmResponseV2_ExecutionResult.fromMap(map);
      case 'Version':
        return XcmResponseV2_Version.fromMap(map);
      default:
        throw UnexpectedCaseException(map['__kind']);
    }
  }
}

class XcmResponseV2_Null extends XcmResponseV2 {
  const XcmResponseV2_Null() : super('Null');
}

class XcmResponseV2_Assets extends XcmResponseV2 {
  final List<MultiAssetV1> value;
  const XcmResponseV2_Assets({required this.value}) : super('Assets');

  static XcmResponseV2_Assets fromMap(Map<String, dynamic> map) =>
      XcmResponseV2_Assets(
          value: (map['value'] as List)
              .map((val) => MultiAssetV1.fromMap(val))
              .toList());
}

class XcmResponseV2_ExecutionResult extends XcmResponseV2 {
  /// [number, XcmErrorV2] or []
  final List<dynamic>? value;
  XcmResponseV2_ExecutionResult({this.value}) : super('ExecutionResult') {
    assertionCheck(
        value == null || value!.length <= 2, 'Max length 2 is allowed');
    if (value != null) {
      assertionCheck(
          value!.isEmpty || value![0] is int, '`int` is allowed at index 0');
      assertionCheck(value!.length != 2 || value![1] is XcmErrorV2,
          '`XcmErrorV2` is allowed at index 1');
    }
  }

  static XcmResponseV2_ExecutionResult fromMap(Map<String, dynamic> map) {
    final value = <dynamic>[];
    var list = map['value'];
    if (list != null && list is List && list.isNotEmpty) {
      value.add(list[0] as int);
      if (list.length > 1) {
        value.add(XcmErrorV2.fromMap(list[1]));
      }
    }

    return XcmResponseV2_ExecutionResult(value: value);
  }
}

class XcmResponseV2_Version extends XcmResponseV2 {
  final int value;
  const XcmResponseV2_Version({required this.value}) : super('Version');

  static XcmResponseV2_Version fromMap(Map<String, dynamic> map) =>
      XcmResponseV2_Version(value: map['value'] as int);
}
