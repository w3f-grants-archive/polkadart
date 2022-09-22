part of xcm_models;

class MultiLocationV1 {
  final int parents;
  final XcmJunctionsV1 interior;
  const MultiLocationV1({required this.parents, required this.interior});

  static MultiLocationV1 fromMap(Map<String, dynamic> map) => MultiLocationV1(
      parents: map['parents'],
      interior: XcmJunctionsV1.fromMap(map['interior']));
}
