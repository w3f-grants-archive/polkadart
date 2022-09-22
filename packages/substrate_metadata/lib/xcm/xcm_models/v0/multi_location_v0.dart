part of xcm_models;

abstract class MultiLocationV0 {
  final String kind;
  const MultiLocationV0(this.kind);

  static MultiLocationV0 fromMap(Map<String, dynamic> map) {
    switch (map['__kind']) {
      case 'Here':
        return MultiLocationV0_Here();
      case 'X1':
        return MultiLocationV0_X1.fromMap(map);
      case 'X2':
        return MultiLocationV0_X2.fromMap(map);
      case 'X3':
        return MultiLocationV0_X3.fromMap(map);
      case 'X4':
        return MultiLocationV0_X4.fromMap(map);
      case 'X5':
        return MultiLocationV0_X5.fromMap(map);
      case 'X6':
        return MultiLocationV0_X6.fromMap(map);
      case 'X7':
        return MultiLocationV0_X7.fromMap(map);
      case 'X8':
        return MultiLocationV0_X8.fromMap(map);
      default:
        throw UnexpectedCaseException(map['__kind']);
    }
  }
}

class MultiLocationV0_Here extends MultiLocationV0 {
  const MultiLocationV0_Here() : super('Here');
}

class MultiLocationV0_X1 extends MultiLocationV0 {
  final XcmJunctionV0 value;
  const MultiLocationV0_X1({required this.value}) : super('X1');

  static MultiLocationV0_X1 fromMap(Map<String, dynamic> map) =>
      MultiLocationV0_X1(value: XcmJunctionV0.fromMap(map['value']));
}

class MultiLocationV0_X2 extends MultiLocationV0 {
  final List<XcmJunctionV0> value;
  MultiLocationV0_X2({required this.value}) : super('X2') {
    assertionCheck(value.length <= 2, 'Only `2 XcmJunctionV0` allowed.');
  }

  static MultiLocationV0_X2 fromMap(
          Map<String, dynamic> map) =>
      MultiLocationV0_X2(
          value: (map['value'] as List)
              .map((val) => XcmJunctionV0.fromMap(val))
              .toList());
}

class MultiLocationV0_X3 extends MultiLocationV0 {
  final List<XcmJunctionV0> value;
  MultiLocationV0_X3({required this.value}) : super('X3') {
    assertionCheck(value.length <= 3, 'Only `3 XcmJunctionV0` allowed.');
  }

  static MultiLocationV0_X3 fromMap(
          Map<String, dynamic> map) =>
      MultiLocationV0_X3(
          value: (map['value'] as List)
              .map((val) => XcmJunctionV0.fromMap(val))
              .toList());
}

class MultiLocationV0_X4 extends MultiLocationV0 {
  final List<XcmJunctionV0> value;
  MultiLocationV0_X4({required this.value}) : super('X4') {
    assertionCheck(value.length <= 4, 'Only `4 XcmJunctionV0` allowed.');
  }

  static MultiLocationV0_X4 fromMap(
          Map<String, dynamic> map) =>
      MultiLocationV0_X4(
          value: (map['value'] as List)
              .map((val) => XcmJunctionV0.fromMap(val))
              .toList());
}

class MultiLocationV0_X5 extends MultiLocationV0 {
  final List<XcmJunctionV0> value;
  MultiLocationV0_X5({required this.value}) : super('X5') {
    assertionCheck(value.length <= 5, 'Only `5 XcmJunctionV0` allowed.');
  }

  static MultiLocationV0_X5 fromMap(
          Map<String, dynamic> map) =>
      MultiLocationV0_X5(
          value: (map['value'] as List)
              .map((val) => XcmJunctionV0.fromMap(val))
              .toList());
}

class MultiLocationV0_X6 extends MultiLocationV0 {
  final List<XcmJunctionV0> value;
  MultiLocationV0_X6({required this.value}) : super('X6') {
    assertionCheck(value.length <= 6, 'Only `6 XcmJunctionV0` allowed.');
  }

  static MultiLocationV0_X6 fromMap(
          Map<String, dynamic> map) =>
      MultiLocationV0_X6(
          value: (map['value'] as List)
              .map((val) => XcmJunctionV0.fromMap(val))
              .toList());
}

class MultiLocationV0_X7 extends MultiLocationV0 {
  final List<XcmJunctionV0> value;
  MultiLocationV0_X7({required this.value}) : super('X7') {
    assertionCheck(value.length <= 7, 'Only `7 XcmJunctionV0` allowed.');
  }

  static MultiLocationV0_X7 fromMap(
          Map<String, dynamic> map) =>
      MultiLocationV0_X7(
          value: (map['value'] as List)
              .map((val) => XcmJunctionV0.fromMap(val))
              .toList());
}

class MultiLocationV0_X8 extends MultiLocationV0 {
  final List<XcmJunctionV0> value;
  MultiLocationV0_X8({required this.value}) : super('X8') {
    assertionCheck(value.length <= 8, 'Only `8 XcmJunctionV0` allowed.');
  }

  static MultiLocationV0_X8 fromMap(
          Map<String, dynamic> map) =>
      MultiLocationV0_X8(
          value: (map['value'] as List)
              .map((val) => XcmJunctionV0.fromMap(val))
              .toList());
}
