import '../../utils/common_utils.dart';
import 'definitions/metadata/index.dart' as metadata_definitions;
import 'definitions/substrate/src.dart';
import 'types.dart';

OldTypes getTypesFromBundle(OldTypesBundle bundle, int specVersion) {
  var types = OldTypes(
    types: <String, dynamic>{
      /// TODO: check `metadata_definitions.types.types` whether it is unwrapping every child element
      /// or only types variable
      if (metadata_definitions.types.types != null)
        ...metadata_definitions.types.types!,
      if (substrateBundle.types != null) ...substrateBundle.types!,
      if (bundle.types != null) ...bundle.types!,
    },
    typesAlias: <String, Map<String, String>>{
      if (substrateBundle.typesAlias != null) ...substrateBundle.typesAlias!,
      if (bundle.typesAlias != null) ...bundle.typesAlias!,
    },
    signedExtensions: <String, String>{
      if (substrateBundle.signedExtensions != null)
        ...substrateBundle.signedExtensions!,
      if (bundle.signedExtensions != null) ...bundle.signedExtensions!,
    },
  );

  if (!isNotEmpty(bundle.versions?.length)) {
    return types;
  }

  for (var i = 0; i < bundle.versions!.length; i++) {
    var override = bundle.versions![i];
    if (isWithinRange(override.minmax, specVersion)) {
      types.types ??= <String, dynamic>{};
      if (override.types != null) {
        types.types!.addAll(override.types!);
      }

      types.typesAlias ??= <String, Map<String, String>>{};
      if (override.typesAlias != null) {
        types.typesAlias!.addAll(override.typesAlias!);
      }

      types.signedExtensions ??= <String, String>{};
      if (override.signedExtensions != null) {
        types.signedExtensions!.addAll(override.signedExtensions!);
      }
    }
  }

  return types;
}

bool isWithinRange(SpecVersionRange range, int version) {
  var beg = range[0] ?? 0;
  var end = range[1] ?? double.maxFinite;
  return beg <= version && version <= end;
}
