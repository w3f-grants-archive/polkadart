class UnexpectedTypeException implements Exception {
  const UnexpectedTypeException([this.type]);

  // Unexpected type
  final dynamic type;

  @override
  String toString() {
    return 'Unexpected type${type == null ? '' : ': ${type.runtimeType}'}.';
  }
}
