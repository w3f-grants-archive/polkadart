part of xcm_models;

abstract class XcmFungibilityV1 {
  final String kind;
  const XcmFungibilityV1(this.kind);

  static XcmFungibilityV1 fromMap(Map<String, dynamic> map) {
    switch (map['__kind']) {
      case 'Fungible':
        return XcmFungibilityV1_Fungible.fromMap(map);
      case 'NonFungible':
        return XcmFungibilityV1_NonFungible.fromMap(map);
      default:
        throw UnexpectedCaseException();
    }
  }
}

class XcmFungibilityV1_Fungible extends XcmFungibilityV1 {
  final BigInt value;
  const XcmFungibilityV1_Fungible({required this.value}) : super('Fungible');

  static XcmFungibilityV1_Fungible fromMap(Map<String, dynamic> map) =>
      XcmFungibilityV1_Fungible(value: parseBigInt(map['value']));
}

class XcmFungibilityV1_NonFungible extends XcmFungibilityV1 {
  final XcmAssetInstanceV1 value;
  const XcmFungibilityV1_NonFungible({required this.value})
      : super('NonFungible');

  static XcmFungibilityV1_NonFungible fromMap(Map<String, dynamic> map) =>
      XcmFungibilityV1_NonFungible(
          value: XcmAssetInstanceV1.fromMap(map['value']));
}
