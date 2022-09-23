part of xcm_models;

abstract class XcmWeightLimitV2 {
  final String kind;
  const XcmWeightLimitV2(this.kind);

  static XcmWeightLimitV2 fromMap(Map<String, dynamic> map) {
    switch (map['__kind']) {
      case 'Unlimited':
        return XcmWeightLimitV2_Unlimited();
      case 'Limited':
        return XcmWeightLimitV2_Limited.fromMap(map);
      default:
        throw UnexpectedCaseException(map['__kind']);
    }
  }
}

class XcmWeightLimitV2_Unlimited extends XcmWeightLimitV2 {
  const XcmWeightLimitV2_Unlimited() : super('Unlimited');
}

class XcmWeightLimitV2_Limited extends XcmWeightLimitV2 {
  final BigInt value;
  const XcmWeightLimitV2_Limited({required this.value}) : super('Limited');

  static XcmWeightLimitV2_Limited fromMap(Map<String, dynamic> map) =>
      XcmWeightLimitV2_Limited(value: parseBigInt(map['value']));
}
