part of xcm_models;

abstract class VersionedMultiLocation {
  final String kind;
  const VersionedMultiLocation(this.kind);

  static VersionedMultiLocation fromMap(Map<String, dynamic> map) {
    switch (map['__kind']) {
      case 'V0':
        return VersionedMultiLocation_V0.fromMap(map);
      case 'V1':
        return VersionedMultiLocation_V1.fromMap(map);
      default:
        throw UnexpectedCaseException(map['__kind']);
    }
  }
}

class VersionedMultiLocation_V0 extends VersionedMultiLocation {
  final MultiLocationV0 value;
  const VersionedMultiLocation_V0({required this.value}) : super('V0');

  static VersionedMultiLocation_V0 fromMap(Map<String, dynamic> map) =>
      VersionedMultiLocation_V0(value: MultiLocationV0.fromMap(map['value']));
}

class VersionedMultiLocation_V1 extends VersionedMultiLocation {
  final MultiLocationV1 value;
  const VersionedMultiLocation_V1({required this.value}) : super('V1');

  static VersionedMultiLocation_V1 fromMap(Map<String, dynamic> map) =>
      VersionedMultiLocation_V1(value: MultiLocationV1.fromMap(map['value']));
}
