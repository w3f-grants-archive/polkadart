class LegacyTypes {
  Map<String, dynamic>? types;
  Map<String, Map<String, String>>? typesAlias;
  Map<String, String>? signedExtensions;

  LegacyTypes({this.types, this.typesAlias, this.signedExtensions});

  static LegacyTypes fromMap(Map<String, dynamic> map) {
    return LegacyTypes(
        types: map['types'],
        typesAlias: map['typesAlias'],
        signedExtensions: map['signedExtensions']);
  }
}

class LegacyTypesWithSpecVersionRange extends LegacyTypes {
  final List<int?> minmax;

  LegacyTypesWithSpecVersionRange(
      {required this.minmax,
      super.types,
      super.typesAlias,
      super.signedExtensions});

  static LegacyTypesWithSpecVersionRange fromMap(Map<String, dynamic> map) {
    return LegacyTypesWithSpecVersionRange(
        minmax: (map['minmax'] as List).cast<int?>(),
        types: map['types'],
        typesAlias: map['typesAlias'],
        signedExtensions: map['signedExtensions']);
  }
}

class LegacyTypesBundle extends LegacyTypes {
  List<LegacyTypesWithSpecVersionRange>? versions;

  LegacyTypesBundle(
      {this.versions, super.types, super.typesAlias, super.signedExtensions});

  static LegacyTypesBundle fromMap(Map<String, dynamic> map) {
    var obj = LegacyTypesBundle(
        types: map['types'],
        typesAlias: map['typesAlias'],
        signedExtensions: map['signedExtensions']);

    if (map['versions'] != null) {
      obj.versions = (map['versions'] as List)
          .map((value) => LegacyTypesWithSpecVersionRange.fromMap(value))
          .toList();
    }

    return obj;
  }
}