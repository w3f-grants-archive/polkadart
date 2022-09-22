part of xcm_models;

class MultiAssetV1 {
  final XcmAssetIdV1 id;
  final XcmFungibilityV1 fungibility;

  const MultiAssetV1({required this.id, required this.fungibility});

  static MultiAssetV1 fromMap(Map<String, dynamic> map) => MultiAssetV1(
      id: XcmAssetIdV1.fromMap(map['id']),
      fungibility: XcmFungibilityV1.fromMap(map['fungibility']));
}
