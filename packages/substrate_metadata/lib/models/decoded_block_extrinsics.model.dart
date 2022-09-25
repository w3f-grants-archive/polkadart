part of models;

class DecodedBlockExtrinsics {
  final int blockNumber;
  final List<dynamic> extrinsics;
  const DecodedBlockExtrinsics(
      {required this.blockNumber, required this.extrinsics});
}
