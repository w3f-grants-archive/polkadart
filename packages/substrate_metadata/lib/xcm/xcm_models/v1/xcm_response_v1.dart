part of xcm_models;

abstract class XcmResponseV1 {
  final String kind;
  const XcmResponseV1(this.kind);

  static XcmResponseV1 fromMap(Map<String, dynamic> map) {
    switch (map['__kind']) {
      case 'Assets':
        return XcmResponseV1_Assets.fromMap(map);
      case 'Version':
        return XcmResponseV1_Version.fromMap(map);
      default:
        throw UnexpectedCaseException(map['__kind']);
    }
  }
}

class XcmResponseV1_Assets extends XcmResponseV1 {
  final List<MultiAssetV1> value;
  const XcmResponseV1_Assets({required this.value}) : super('Assets');

  static XcmResponseV1 fromMap(Map<String, dynamic> map) =>
      XcmResponseV1_Assets(
          value: (map['value'] as List)
              .map((val) => MultiAssetV1.fromMap(val))
              .toList());
}

class XcmResponseV1_Version extends XcmResponseV1 {
  /// XcmVersion ~ number
  final int value;
  const XcmResponseV1_Version({required this.value}) : super('Version');

  static XcmResponseV1 fromMap(Map<String, dynamic> map) =>
      XcmResponseV1_Version(value: map['value']);
}
