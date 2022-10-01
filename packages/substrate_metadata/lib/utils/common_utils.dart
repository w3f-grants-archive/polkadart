import 'dart:io';

import 'package:substrate_metadata/exceptions/unexpected_exception.dart';

bool isNotEmpty(dynamic value) {
  if (value == null) {
    return false;
  }
  if (value is bool) {
    return value;
  } else if (value is String) {
    return value.trim() != '';
  } else if (value is num) {
    return value != 0;
  } else if (value is Map) {
    return value.isNotEmpty;
  } else if (value is List) {
    return value.isNotEmpty;
  }
  throw Exception('Unknown Type Exception');
}

/// Asserts if the `T` value is null or not.
///
/// Returns `T` if not null otherwise throws `AssertionException`
T assertNotNull<T>(T? val, [String? msg]) {
  if (val == null) {
    throw AssertionError(msg ?? 'Assertion Error occured.');
  }
  return val;
}

/// Asserts if the [val] value is true or not
///
/// Throws `AssertionException` if `false`
void assertionCheck(bool val, [String? msg]) {
  if (!val) {
    throw AssertionError(msg ?? 'Assertion Error occured.');
  }
}

List<String> readLines(String filePath) {
  return File(filePath).readAsLinesSync();
}

BigInt parseBigInt(dynamic bigInt) {
  if (bigInt is num) {
    return BigInt.from(bigInt);
  } else if (bigInt is String) {
    if (bigInt.endsWith('n') && bigInt.length > 1) {
      ///
      /// checked if bigint has a number appended with 'n' or not
      return BigInt.parse(bigInt.substring(0, bigInt.length - 1));
    }
    return BigInt.parse(bigInt);
  }
  throw UnexpectedTypeException();
}
