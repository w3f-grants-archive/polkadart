part of xcm_models;

///
/// Abstract Class
abstract class XcmBodyIdV0 {
  final String kind;
  const XcmBodyIdV0(this.kind);

  /// Construct Object from Json
  static XcmBodyIdV0 fromMap(Map<String, dynamic> map) {
    switch (map['__kind']) {
      case 'Unit':
        return XcmBodyIdV0_Unit();
      case 'Named':
        return XcmBodyIdV0_Named.fromMap(map);
      case 'Index':
        return XcmBodyIdV0_Index.fromMap(map);
      case 'Executive':
        return XcmBodyIdV0_Executive();
      case 'Technical':
        return XcmBodyIdV0_Technical();
      case 'Legislative':
        return XcmBodyIdV0_Legislative();
      case 'Judicial':
        return XcmBodyIdV0_Judicial();
      default:
        throw UnexpectedCaseException();
    }
  }
}

class XcmBodyIdV0_Unit extends XcmBodyIdV0 {
  const XcmBodyIdV0_Unit() : super('Unit');
}

class XcmBodyIdV0_Named extends XcmBodyIdV0 {
  final Uint8List value;
  const XcmBodyIdV0_Named({required this.value}) : super('Named');

  /// Construct Object from Json
  static XcmBodyIdV0_Named fromMap(Map<String, dynamic> map) =>
      XcmBodyIdV0_Named(
          value: Uint8List.fromList((map['value'] as List).cast<int>()));
}

class XcmBodyIdV0_Index extends XcmBodyIdV0 {
  final int value;
  const XcmBodyIdV0_Index({required this.value}) : super('Index');

  /// Construct Object from Json
  static XcmBodyIdV0_Index fromMap(Map<String, dynamic> map) =>
      XcmBodyIdV0_Index(value: map['value']);
}

class XcmBodyIdV0_Executive extends XcmBodyIdV0 {
  const XcmBodyIdV0_Executive() : super('Executive');
}

class XcmBodyIdV0_Technical extends XcmBodyIdV0 {
  const XcmBodyIdV0_Technical() : super('Technical');
}

class XcmBodyIdV0_Legislative extends XcmBodyIdV0 {
  const XcmBodyIdV0_Legislative() : super('Legislative');
}

class XcmBodyIdV0_Judicial extends XcmBodyIdV0 {
  const XcmBodyIdV0_Judicial() : super('Judicial');
}
