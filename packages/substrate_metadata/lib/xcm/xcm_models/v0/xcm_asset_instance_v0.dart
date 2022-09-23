part of xcm_models;

///
/// Abstract Class
abstract class XcmAssetInstanceV0 {
  final String kind;
  const XcmAssetInstanceV0(this.kind);

  /// Construct Object from Json
  static XcmAssetInstanceV0 fromMap(Map<String, dynamic> map) {
    switch (map['__kind']) {
      case 'Undefined':
        return XcmAssetInstanceV0_Undefined.fromMap(map);
      case 'Index8':
        return XcmAssetInstanceV0_Index8.fromMap(map);
      case 'Index16':
        return XcmAssetInstanceV0_Index16.fromMap(map);
      case 'Index32':
        return XcmAssetInstanceV0_Index32.fromMap(map);
      case 'Index64':
        return XcmAssetInstanceV0_Index64.fromMap(map);
      case 'Index128':
        return XcmAssetInstanceV0_Index128.fromMap(map);
      case 'Array4':
        return XcmAssetInstanceV0_Array4.fromMap(map);
      case 'Array8':
        return XcmAssetInstanceV0_Array8.fromMap(map);
      case 'Array16':
        return XcmAssetInstanceV0_Array16.fromMap(map);
      case 'Array32':
        return XcmAssetInstanceV0_Array32.fromMap(map);
      case 'Blob':
        return XcmAssetInstanceV0_Blob.fromMap(map);
      default:
        throw UnexpectedCaseException(map['__kind']);
    }
  }
}

class XcmAssetInstanceV0_Undefined extends XcmAssetInstanceV0 {
  const XcmAssetInstanceV0_Undefined() : super('Undefined');

  /// Construct Object from Json
  static XcmAssetInstanceV0_Undefined fromMap(Map<String, dynamic> map) =>
      XcmAssetInstanceV0_Undefined();
}

class XcmAssetInstanceV0_Index8 extends XcmAssetInstanceV0 {
  final int value;
  const XcmAssetInstanceV0_Index8({required this.value}) : super('Index8');

  /// Construct Object from Json
  static XcmAssetInstanceV0_Index8 fromMap(Map<String, dynamic> map) =>
      XcmAssetInstanceV0_Index8(value: map['value']);
}

class XcmAssetInstanceV0_Index16 extends XcmAssetInstanceV0 {
  final int value;
  const XcmAssetInstanceV0_Index16({required this.value}) : super('Index16');

  /// Construct Object from Json
  static XcmAssetInstanceV0_Index16 fromMap(Map<String, dynamic> map) =>
      XcmAssetInstanceV0_Index16(value: map['value']);
}

class XcmAssetInstanceV0_Index32 extends XcmAssetInstanceV0 {
  final int value;
  const XcmAssetInstanceV0_Index32({required this.value}) : super('Index32');

  /// Construct Object from Json
  static XcmAssetInstanceV0_Index32 fromMap(Map<String, dynamic> map) =>
      XcmAssetInstanceV0_Index32(value: map['value']);
}

class XcmAssetInstanceV0_Index64 extends XcmAssetInstanceV0 {
  final BigInt value;
  const XcmAssetInstanceV0_Index64({required this.value}) : super('Index64');

  /// Construct Object from Json
  static XcmAssetInstanceV0_Index64 fromMap(Map<String, dynamic> map) =>
      XcmAssetInstanceV0_Index64(value: map['value']);
}

class XcmAssetInstanceV0_Index128 extends XcmAssetInstanceV0 {
  final BigInt value;
  const XcmAssetInstanceV0_Index128({required this.value}) : super('Index128');

  /// Construct Object from Json
  static XcmAssetInstanceV0_Index128 fromMap(Map<String, dynamic> map) =>
      XcmAssetInstanceV0_Index128(value: map['value']);
}

class XcmAssetInstanceV0_Array4 extends XcmAssetInstanceV0 {
  final Uint8List value;
  const XcmAssetInstanceV0_Array4({required this.value}) : super('Array4');

  /// Construct Object from Json
  static XcmAssetInstanceV0_Array4 fromMap(Map<String, dynamic> map) =>
      XcmAssetInstanceV0_Array4(value: map['value']);
}

class XcmAssetInstanceV0_Array8 extends XcmAssetInstanceV0 {
  final Uint8List value;
  const XcmAssetInstanceV0_Array8({required this.value}) : super('Array8');

  /// Construct Object from Json
  static XcmAssetInstanceV0_Array8 fromMap(Map<String, dynamic> map) =>
      XcmAssetInstanceV0_Array8(value: map['value']);
}

class XcmAssetInstanceV0_Array16 extends XcmAssetInstanceV0 {
  final Uint8List value;
  const XcmAssetInstanceV0_Array16({required this.value}) : super('Array16');

  /// Construct Object from Json
  static XcmAssetInstanceV0_Array16 fromMap(Map<String, dynamic> map) =>
      XcmAssetInstanceV0_Array16(value: map['value']);
}

class XcmAssetInstanceV0_Array32 extends XcmAssetInstanceV0 {
  final Uint8List value;
  const XcmAssetInstanceV0_Array32({required this.value}) : super('Array32');

  /// Construct Object from Json
  static XcmAssetInstanceV0_Array32 fromMap(Map<String, dynamic> map) =>
      XcmAssetInstanceV0_Array32(value: map['value']);
}

class XcmAssetInstanceV0_Blob extends XcmAssetInstanceV0 {
  final Uint8List value;
  const XcmAssetInstanceV0_Blob({required this.value}) : super('Blob');

  /// Construct Object from Json
  static XcmAssetInstanceV0_Blob fromMap(Map<String, dynamic> map) =>
      XcmAssetInstanceV0_Blob(value: map['value']);
}
