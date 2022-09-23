part of xcm_models;

abstract class XcmWildMultiAssetV1 {
  final String kind;
  const XcmWildMultiAssetV1(this.kind);

  static XcmWildMultiAssetV1 fromMap(Map<String, dynamic> map) {
    switch (map['__kind']) {
      case 'All':
        return XcmWildMultiAssetV1_All();
      case 'AllOf':
        return XcmWildMultiAssetV1_AllOf.fromMap(map);
      default:
        throw UnexpectedCaseException(map['__kind']);
    }
  }
}

class XcmWildMultiAssetV1_All extends XcmWildMultiAssetV1 {
  const XcmWildMultiAssetV1_All() : super('All');
}

class XcmWildMultiAssetV1_AllOf extends XcmWildMultiAssetV1 {
  final XcmAssetIdV1 id;
  final XcmWildFungibilityV1 fungibility;
  const XcmWildMultiAssetV1_AllOf({required this.id, required this.fungibility})
      : super('AllOf');

  static XcmWildMultiAssetV1_AllOf fromMap(Map<String, dynamic> map) =>
      XcmWildMultiAssetV1_AllOf(
          id: XcmAssetIdV1.fromMap(map['id']),
          fungibility: XcmWildFungibilityV1.fromMap(map['fungibility']));
}
