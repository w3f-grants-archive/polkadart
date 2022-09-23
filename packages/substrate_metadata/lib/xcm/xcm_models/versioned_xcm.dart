part of xcm_models;

abstract class VersionedXcm {
  final String kind;
  const VersionedXcm(this.kind);

  static VersionedXcm fromMap(Map<String, dynamic> map) {
    switch (map['__kind']) {
      case 'V0':
        return VersionedXcm_V0.fromMap(map);
      case 'V1':
        return VersionedXcm_V1.fromMap(map);
      case 'V2':
        return VersionedXcm_V2.fromMap(map);
      default:
        throw UnexpectedCaseException(map['__kind']);
    }
  }
}

class VersionedXcm_V0 extends VersionedXcm {
  final XcmV0 value;
  const VersionedXcm_V0({required this.value}) : super('V0');

  static VersionedXcm_V0 fromMap(Map<String, dynamic> map) =>
      VersionedXcm_V0(value: XcmV0.fromMap(map['value']));
}

class VersionedXcm_V1 extends VersionedXcm {
  final XcmV1 value;
  const VersionedXcm_V1({required this.value}) : super('V1');

  static VersionedXcm_V1 fromMap(Map<String, dynamic> map) =>
      VersionedXcm_V1(value: XcmV1.fromMap(map['value']));
}

class VersionedXcm_V2 extends VersionedXcm {
  /// XcmV2 ~ List<XcmInstructionV2>
  final List<XcmInstructionV2> value;
  const VersionedXcm_V2({required this.value}) : super('V2');

  static VersionedXcm_V2 fromMap(Map<String, dynamic> map) => VersionedXcm_V2(
      value: (map['value'] as List)
          .map((val) => XcmInstructionV2.fromMap(val))
          .toList());
}
