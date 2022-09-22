part of xcm_models;

abstract class XcmJunctionsV1 {
  final String kind;
  const XcmJunctionsV1(this.kind);

  static XcmJunctionsV1 fromMap(Map<String, dynamic> map) {
    switch (map['__kind']) {
      case 'Here':
        return XcmJunctionsV1_Here();
      case 'X1':
        return XcmJunctionsV1_X1.fromMap(map);
      case 'X2':
        return XcmJunctionsV1_X2.fromMap(map);
      case 'X3':
        return XcmJunctionsV1_X3.fromMap(map);
      case 'X4':
        return XcmJunctionsV1_X4.fromMap(map);
      case 'X5':
        return XcmJunctionsV1_X5.fromMap(map);
      case 'X6':
        return XcmJunctionsV1_X6.fromMap(map);
      case 'X7':
        return XcmJunctionsV1_X7.fromMap(map);
      case 'X8':
        return XcmJunctionsV1_X8.fromMap(map);
      default:
        throw UnexpectedCaseException(map['__kind']);
    }
  }
}

class XcmJunctionsV1_Here extends XcmJunctionsV1 {
  const XcmJunctionsV1_Here() : super('Here');
}

class XcmJunctionsV1_X1 extends XcmJunctionsV1 {
  final XcmJunctionV1 value;
  const XcmJunctionsV1_X1({required this.value}) : super('X1');

  static XcmJunctionsV1_X1 fromMap(Map<String, dynamic> map) =>
      XcmJunctionsV1_X1(value: XcmJunctionV1.fromMap(map['value']));
}

class XcmJunctionsV1_X2 extends XcmJunctionsV1 {
  final List<XcmJunctionV1> value;
  XcmJunctionsV1_X2({required this.value}) : super('X2') {
    assertionCheck(value.length <= 2, 'Only `2 XcmJunctionV1` allowed.');
  }

  static XcmJunctionsV1_X2 fromMap(Map<String, dynamic> map) =>
      XcmJunctionsV1_X2(
          value: (map['value'] as List)
              .map((val) => XcmJunctionV1.fromMap(val))
              .toList());
}

class XcmJunctionsV1_X3 extends XcmJunctionsV1 {
  final List<XcmJunctionV1> value;
  XcmJunctionsV1_X3({required this.value}) : super('X3') {
    assertionCheck(value.length <= 3, 'Only `3 XcmJunctionV1` allowed.');
  }

  static XcmJunctionsV1_X3 fromMap(Map<String, dynamic> map) =>
      XcmJunctionsV1_X3(
          value: (map['value'] as List)
              .map((val) => XcmJunctionV1.fromMap(val))
              .toList());
}

class XcmJunctionsV1_X4 extends XcmJunctionsV1 {
  final List<XcmJunctionV1> value;
  XcmJunctionsV1_X4({required this.value}) : super('X4') {
    assertionCheck(value.length <= 4, 'Only `4 XcmJunctionV1` allowed.');
  }

  static XcmJunctionsV1_X4 fromMap(Map<String, dynamic> map) =>
      XcmJunctionsV1_X4(
          value: (map['value'] as List)
              .map((val) => XcmJunctionV1.fromMap(val))
              .toList());
}

class XcmJunctionsV1_X5 extends XcmJunctionsV1 {
  final List<XcmJunctionV1> value;
  XcmJunctionsV1_X5({required this.value}) : super('X5') {
    assertionCheck(value.length <= 5, 'Only `5 XcmJunctionV1` allowed.');
  }

  static XcmJunctionsV1_X5 fromMap(Map<String, dynamic> map) =>
      XcmJunctionsV1_X5(
          value: (map['value'] as List)
              .map((val) => XcmJunctionV1.fromMap(val))
              .toList());
}

class XcmJunctionsV1_X6 extends XcmJunctionsV1 {
  final List<XcmJunctionV1> value;
  XcmJunctionsV1_X6({required this.value}) : super('X6') {
    assertionCheck(value.length <= 6, 'Only `6 XcmJunctionV1` allowed.');
  }

  static XcmJunctionsV1_X6 fromMap(Map<String, dynamic> map) =>
      XcmJunctionsV1_X6(
          value: (map['value'] as List)
              .map((val) => XcmJunctionV1.fromMap(val))
              .toList());
}

class XcmJunctionsV1_X7 extends XcmJunctionsV1 {
  final List<XcmJunctionV1> value;
  XcmJunctionsV1_X7({required this.value}) : super('X7') {
    assertionCheck(value.length <= 7, 'Only `7 XcmJunctionV1` allowed.');
  }

  static XcmJunctionsV1_X7 fromMap(Map<String, dynamic> map) =>
      XcmJunctionsV1_X7(
          value: (map['value'] as List)
              .map((val) => XcmJunctionV1.fromMap(val))
              .toList());
}

class XcmJunctionsV1_X8 extends XcmJunctionsV1 {
  final List<XcmJunctionV1> value;
  XcmJunctionsV1_X8({required this.value}) : super('X8') {
    assertionCheck(value.length <= 8, 'Only `8 XcmJunctionV1` allowed.');
  }

  static XcmJunctionsV1_X8 fromMap(Map<String, dynamic> map) =>
      XcmJunctionsV1_X8(
          value: (map['value'] as List)
              .map((val) => XcmJunctionV1.fromMap(val))
              .toList());
}
