part of models;

class VersionDescription extends SpecVersion {
  final ChainDescription description;
  final scale_codec.Codec codec;
  final Registry events;
  final Registry calls;

  VersionDescription(
      {required this.description,
      required this.codec,
      required this.events,
      required this.calls,
      required super.metadata,
      required super.specName,
      required super.specVersion,
      required super.blockNumber,
      required super.blockHash});
}
