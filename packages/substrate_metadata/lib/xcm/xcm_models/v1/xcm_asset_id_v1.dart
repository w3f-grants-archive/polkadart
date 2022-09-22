part of xcm_models;

abstract class XcmAssetIdV1 {
  final String kind;
  const XcmAssetIdV1(this.kind);

  static XcmAssetIdV1 fromMap(Map<String, dynamic> map) {
    switch (map['__kind']) {
      case 'Concrete':
        return XcmAssetIdV1_Concrete.fromMap(map);
      case 'Abstract':
        return XcmAssetIdV1_Abstract.fromMap(map);
      default:
        throw UnexpectedCaseException(map['__kind']);
    }
  }
}

class XcmAssetIdV1_Concrete extends XcmAssetIdV1 {
  final MultiLocationV1 value;
  const XcmAssetIdV1_Concrete({required this.value}) : super('Concrete');

  static XcmAssetIdV1 fromMap(Map<String, dynamic> map) =>
      XcmAssetIdV1_Concrete(value: MultiLocationV1.fromMap(map['value']));
}

class XcmAssetIdV1_Abstract extends XcmAssetIdV1 {
  final Uint8List value;
  const XcmAssetIdV1_Abstract({required this.value}) : super('Abstract');

  static XcmAssetIdV1 fromMap(Map<String, dynamic> map) =>
      XcmAssetIdV1_Abstract(
          value: Uint8List.fromList((map['value'] as List).cast<int>()));
}
