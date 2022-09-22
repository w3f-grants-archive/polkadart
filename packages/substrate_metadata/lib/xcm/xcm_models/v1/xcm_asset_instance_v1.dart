part of xcm_models;

abstract class XcmAssetInstanceV1 {
  final String kind;
  const XcmAssetInstanceV1(this.kind);

  static XcmAssetInstanceV1 fromMap(Map<String, dynamic> map) {
    switch (map['__kind']) {
      case 'Undefined':
        return XcmAssetInstanceV1_Undefined();
      case 'Index':
        return XcmAssetInstanceV1_Index.fromMap(map);
      case 'Array4':
        return XcmAssetInstanceV1_Array4.fromMap(map);
      case 'Array8':
        return XcmAssetInstanceV1_Array8.fromMap(map);
      case 'Array16':
        return XcmAssetInstanceV1_Array16.fromMap(map);
      case 'Array32':
        return XcmAssetInstanceV1_Array32.fromMap(map);
      case 'Blob':
        return XcmAssetInstanceV1_Blob.fromMap(map);
      default:
        throw UnexpectedCaseException(map['__kind']);
    }
  }
}

class XcmAssetInstanceV1_Undefined extends XcmAssetInstanceV1 {
  const XcmAssetInstanceV1_Undefined() : super('Undefined');
}

class XcmAssetInstanceV1_Index extends XcmAssetInstanceV1 {
  final BigInt value;
  const XcmAssetInstanceV1_Index({required this.value}) : super('Index');

  static XcmAssetInstanceV1_Index fromMap(Map<String, dynamic> map) =>
      XcmAssetInstanceV1_Index(value: parseBigInt(map['value']));
}

class XcmAssetInstanceV1_Array4 extends XcmAssetInstanceV1 {
  final Uint8List value;
  const XcmAssetInstanceV1_Array4({required this.value}) : super('Array4');

  static XcmAssetInstanceV1_Array4 fromMap(Map<String, dynamic> map) =>
      XcmAssetInstanceV1_Array4(
          value: Uint8List.fromList((map['value'] as List).cast<int>()));
}

class XcmAssetInstanceV1_Array8 extends XcmAssetInstanceV1 {
  final Uint8List value;
  const XcmAssetInstanceV1_Array8({required this.value}) : super('Array8');

  static XcmAssetInstanceV1_Array8 fromMap(Map<String, dynamic> map) =>
      XcmAssetInstanceV1_Array8(
          value: Uint8List.fromList((map['value'] as List).cast<int>()));
}

class XcmAssetInstanceV1_Array16 extends XcmAssetInstanceV1 {
  final Uint8List value;
  const XcmAssetInstanceV1_Array16({required this.value}) : super('Array16');

  static XcmAssetInstanceV1_Array16 fromMap(Map<String, dynamic> map) =>
      XcmAssetInstanceV1_Array16(
          value: Uint8List.fromList((map['value'] as List).cast<int>()));
}

class XcmAssetInstanceV1_Array32 extends XcmAssetInstanceV1 {
  final Uint8List value;
  const XcmAssetInstanceV1_Array32({required this.value}) : super('Array32');

  static XcmAssetInstanceV1_Array32 fromMap(Map<String, dynamic> map) =>
      XcmAssetInstanceV1_Array32(
          value: Uint8List.fromList((map['value'] as List).cast<int>()));
}

class XcmAssetInstanceV1_Blob extends XcmAssetInstanceV1 {
  final Uint8List value;
  const XcmAssetInstanceV1_Blob({required this.value}) : super('Blob');

  static XcmAssetInstanceV1_Blob fromMap(Map<String, dynamic> map) =>
      XcmAssetInstanceV1_Blob(
          value: Uint8List.fromList((map['value'] as List).cast<int>()));
}
