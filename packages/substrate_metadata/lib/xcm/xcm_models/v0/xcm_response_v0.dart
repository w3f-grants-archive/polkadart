part of xcm_models;

abstract class XcmResponseV0 {
  final String kind;
  final List<MultiAssetV0> value;
  const XcmResponseV0(this.kind, this.value);

  static XcmResponseV0 fromMap(Map<String, dynamic> map) =>
      XcmResponseV0_Assets(map['value']);
}

class XcmResponseV0_Assets extends XcmResponseV0 {
  @override
  final List<MultiAssetV0> value;
  const XcmResponseV0_Assets(this.value) : super('Assets', value);
}
