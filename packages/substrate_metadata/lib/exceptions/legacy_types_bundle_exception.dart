part of exceptions;

class LegacyTypesBundleException implements Exception {
  const LegacyTypesBundleException(this.msg);

  final String msg;

  @override
  String toString() {
    return msg;
  }
}
