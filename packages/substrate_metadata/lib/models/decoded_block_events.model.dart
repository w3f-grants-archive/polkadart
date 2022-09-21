part of models;

class DecodedBlockEvents {
  final int blockNumber;
  final List<dynamic> events;
  const DecodedBlockEvents({required this.blockNumber, required this.events});
}
