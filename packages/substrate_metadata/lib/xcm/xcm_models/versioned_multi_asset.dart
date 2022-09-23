part of xcm_models;

abstract class VersionedMultiAsset {
  final String kind;
  const VersionedMultiAsset(this.kind);

  static VersionedMultiAsset fromMap(Map<String, dynamic> map) {
    switch (map['__kind']) {
      case 'V0':
        return VersionedMultiAsset_V0.fromMap(map);
      case 'V1':
        return VersionedMultiAsset_V1.fromMap(map);
      default:
        throw UnexpectedCaseException(map['__kind']);
    }
  }
}

class VersionedMultiAsset_V0 extends VersionedMultiAsset {
  final MultiAssetV0 value;
  const VersionedMultiAsset_V0({required this.value}) : super('V0');

  static VersionedMultiAsset_V0 fromMap(Map<String, dynamic> map) =>
      VersionedMultiAsset_V0(value: MultiAssetV0.fromMap(map['value']));
}

class VersionedMultiAsset_V1 extends VersionedMultiAsset {
  final MultiAssetV1 value;
  const VersionedMultiAsset_V1({required this.value}) : super('V1');

  static VersionedMultiAsset_V1 fromMap(Map<String, dynamic> map) =>
      VersionedMultiAsset_V1(value: MultiAssetV1.fromMap(map['value']));
}
