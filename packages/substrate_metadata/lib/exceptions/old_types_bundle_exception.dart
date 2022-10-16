class LegacyTypesBundleException implements Exception {
  const LegacyTypesBundleException([this.fileName, this.error]);

  final String? fileName;
  final Object? error;

  @override
  String toString() {
    return fileName == null || error == null
        ? 'Failed to parse LegacyTypesBundle'
        : 'Failed to parse $fileName: $error';
  }
}
