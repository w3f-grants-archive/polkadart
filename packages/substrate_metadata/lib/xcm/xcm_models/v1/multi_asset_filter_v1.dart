part of xcm_models;

abstract class MultiAssetFilterV1 {
  final String kind;
  const MultiAssetFilterV1(this.kind);

  static MultiAssetFilterV1 fromMap(Map<String, dynamic> map) {
    switch (map['__kind']) {
      case 'Definite':
        return MultiAssetFilterV1_Definite.fromMap(map);
      case 'Wild':
        return MultiAssetFilterV1_Wild.fromMap(map);
      default:
        throw UnexpectedCaseException(map['__kind']);
    }
  }
}

class MultiAssetFilterV1_Definite extends MultiAssetFilterV1 {
  final List<MultiAssetV1> value;
  const MultiAssetFilterV1_Definite({required this.value}) : super('Definite');

  static MultiAssetFilterV1_Definite fromMap(Map<String, dynamic> map) =>
      MultiAssetFilterV1_Definite(
        value: (map['value'] as List)
            .map((val) => MultiAssetV1.fromMap(val))
            .toList(),
      );
}

class MultiAssetFilterV1_Wild extends MultiAssetFilterV1 {
  final XcmWildMultiAssetV1 value;
  const MultiAssetFilterV1_Wild({required this.value}) : super('Wild');

  static MultiAssetFilterV1_Wild fromMap(Map<String, dynamic> map) =>
      MultiAssetFilterV1_Wild(value: XcmWildMultiAssetV1.fromMap(map['value']));
}
