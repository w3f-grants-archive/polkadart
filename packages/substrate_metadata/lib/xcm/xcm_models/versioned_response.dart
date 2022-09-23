part of xcm_models;

abstract class VersionedResponse {
  final String kind;
  const VersionedResponse(this.kind);

  static VersionedResponse fromMap(Map<String, dynamic> map) {
    switch (map['__kind']) {
      case 'V0':
        return VersionedResponse_V0.fromMap(map);
      case 'V1':
        return VersionedResponse_V1.fromMap(map);
      case 'V2':
        return VersionedResponse_V2.fromMap(map);
      default:
        throw UnexpectedCaseException(map['__kind']);
    }
  }
}

class VersionedResponse_V0 extends VersionedResponse {
  final XcmResponseV0 value;
  const VersionedResponse_V0({required this.value}) : super('V0');

  static VersionedResponse_V0 fromMap(Map<String, dynamic> map) =>
      VersionedResponse_V0(value: XcmResponseV0.fromMap(map['value']));
}

class VersionedResponse_V1 extends VersionedResponse {
  final XcmResponseV1 value;
  const VersionedResponse_V1({required this.value}) : super('V1');

  static VersionedResponse_V1 fromMap(Map<String, dynamic> map) =>
      VersionedResponse_V1(value: XcmResponseV1.fromMap(map['value']));
}

class VersionedResponse_V2 extends VersionedResponse {
  final XcmResponseV2 value;
  const VersionedResponse_V2({required this.value}) : super('V2');

  static VersionedResponse_V2 fromMap(Map<String, dynamic> map) =>
      VersionedResponse_V2(value: XcmResponseV2.fromMap(map['value']));
}
