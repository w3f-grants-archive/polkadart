import 'dart:collection';

import 'package:substrate_metadata/utils/common_utils.dart';

abstract class OldTypeDefinition {}

class OldTypes {
  Map<String, dynamic>? types;
  Map<String, Map<String, String>>? typesAlias;
  Map<String, String>? signedExtensions;

  OldTypes({this.types, this.typesAlias, this.signedExtensions});

  static OldTypes fromMap(Map<String, dynamic> map) {
    return OldTypes(
        types: map['types'],
        typesAlias: map['typesAlias'],
        signedExtensions: map['signedExtensions']);
  }
}

class SpecVersionRange extends ListMixin<int?> {
  @override
  int length = 2;

  final List<int?> _data = List<int?>.filled(2, null);

  SpecVersionRange(List<int?> value) {
    assertionCheck(value.length == 2);
    this[0] = value[0];
    this[1] = value[1];
  }

  @override
  int? operator [](int index) {
    return _data[index];
  }

  @override
  void operator []=(int index, int? value) {
    _data[index] = value;
  }
}

class OldTypesWithSpecVersionRange extends OldTypes {
  final SpecVersionRange minmax;

  OldTypesWithSpecVersionRange(
      {required this.minmax,
      super.types,
      super.typesAlias,
      super.signedExtensions});

  static OldTypesWithSpecVersionRange fromMap(Map<String, dynamic> map) {
    return OldTypesWithSpecVersionRange(
        minmax: SpecVersionRange((map['minmax'] as List).cast<int?>()),
        types: map['types'],
        typesAlias: map['typesAlias'],
        signedExtensions: map['signedExtensions']);
  }
}

class OldTypesBundle extends OldTypes {
  List<OldTypesWithSpecVersionRange>? versions;

  OldTypesBundle(
      {this.versions, super.types, super.typesAlias, super.signedExtensions});

  static OldTypesBundle fromMap(Map<String, dynamic> map) {
    var obj = OldTypesBundle(
        types: map['types'],
        typesAlias: map['typesAlias'],
        signedExtensions: map['signedExtensions']);

    if (map['versions'] != null) {
      obj.versions = (map['versions'] as List)
          .map((value) => OldTypesWithSpecVersionRange.fromMap(value))
          .toList();
    }

    return obj;
  }
}
