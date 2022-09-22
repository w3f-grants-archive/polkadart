class UnexpectedTypeException implements Exception {
  const UnexpectedTypeException([this.type]);

  // Unexpected type
  final dynamic type;

  @override
  String toString() {
    return 'Unexpected type${type == null ? '' : ': ${type.runtimeType}'}.';
  }
}

///
/// UnexpectedCaseException
class UnexpectedCaseException implements Exception {
  const UnexpectedCaseException([this.value]);

  final dynamic value;

  @override
  String toString() {
    return 'Unexpected case${value == null ? '' : ': $value'}.';
  }
}
