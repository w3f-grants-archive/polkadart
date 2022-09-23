part of xcm_models;

abstract class XcmWildFungibilityV1 {
  final String kind;
  const XcmWildFungibilityV1(this.kind);

  static XcmWildFungibilityV1 fromMap(Map<String, dynamic> map) {
    switch (map['__kind']) {
      case 'Fungible':
        return XcmWildFungibilityV1_Fungible();
      case 'NonFungible':
        return XcmWildFungibilityV1_NonFungible();
      default:
        throw UnexpectedCaseException(map['__kind']);
    }
  }
}

class XcmWildFungibilityV1_Fungible extends XcmWildFungibilityV1 {
  const XcmWildFungibilityV1_Fungible() : super('Fungible');
}

class XcmWildFungibilityV1_NonFungible extends XcmWildFungibilityV1 {
  const XcmWildFungibilityV1_NonFungible() : super('NonFungible');
}
