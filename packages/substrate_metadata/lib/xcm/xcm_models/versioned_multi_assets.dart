part of xcm_models;

abstract class VersionedMultiAssets {
  final String kind;
  const VersionedMultiAssets(this.kind);

  static VersionedMultiAssets fromMap(Map<String, dynamic> map) {
    switch (map['__kind']) {
      case 'V0':
        return VersionedMultiAssets_V0.fromMap(map);
      case 'V1':
        return VersionedMultiAssets_V1.fromMap(map);
      default:
        throw UnexpectedCaseException(map['__kind']);
    }
  }
}

class VersionedMultiAssets_V0 extends VersionedMultiAssets {
  final List<MultiAssetV0> value;
  const VersionedMultiAssets_V0({required this.value}) : super('V0');

  static VersionedMultiAssets_V0 fromMap(Map<String, dynamic> map) =>
      VersionedMultiAssets_V0(
          value: (map['value'] as List)
              .map((val) => MultiAssetV0.fromMap(val))
              .toList());
}

class VersionedMultiAssets_V1 extends VersionedMultiAssets {
  final List<MultiAssetV1> value;
  const VersionedMultiAssets_V1({required this.value}) : super('V1');

  static VersionedMultiAssets_V1 fromMap(Map<String, dynamic> map) =>
      VersionedMultiAssets_V1(
          value: (map['value'] as List)
              .map((val) => MultiAssetV1.fromMap(val))
              .toList());
}
