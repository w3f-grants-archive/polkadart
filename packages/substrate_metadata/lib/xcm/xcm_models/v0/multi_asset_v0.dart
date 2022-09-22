part of xcm_models;

abstract class MultiAssetV0 {
  final String kind;
  const MultiAssetV0(this.kind);

  static MultiAssetV0 fromMap(Map<String, dynamic> map) {
    switch (map['__kind']) {
      case 'None':
        return MultiAssetV0_None();
      case 'All':
        return MultiAssetV0_All();
      case 'AllFungible':
        return MultiAssetV0_AllFungible();
      case 'AllNonFungible':
        return MultiAssetV0_AllNonFungible();
      case 'AllAbstractFungible':
        return MultiAssetV0_AllAbstractFungible.fromMap(map);
      case 'AllAbstractNonFungible':
        return MultiAssetV0_AllAbstractNonFungible.fromMap(map);
      case 'AllConcreteFungible':
        return MultiAssetV0_AllConcreteFungible.fromMap(map);
      case 'AllConcreteNonFungible':
        return MultiAssetV0_AllConcreteNonFungible.fromMap(map);
      case 'AbstractFungible':
        return MultiAssetV0_AbstractFungible.fromMap(map);
      case 'AbstractNonFungible':
        return MultiAssetV0_AbstractNonFungible.fromMap(map);
      case 'ConcreteFungible':
        return MultiAssetV0_ConcreteFungible.fromMap(map);
      case 'ConcreteNonFungible':
        return MultiAssetV0_ConcreteNonFungible.fromMap(map);
      default:
        throw UnexpectedCaseException(map['__kind']);
    }
  }
}

class MultiAssetV0_None extends MultiAssetV0 {
  const MultiAssetV0_None() : super('None');
}

class MultiAssetV0_All extends MultiAssetV0 {
  const MultiAssetV0_All() : super('All');
}

class MultiAssetV0_AllFungible extends MultiAssetV0 {
  const MultiAssetV0_AllFungible() : super('AllFungible');
}

class MultiAssetV0_AllNonFungible extends MultiAssetV0 {
  const MultiAssetV0_AllNonFungible() : super('AllNonFungible');
}

class MultiAssetV0_AllAbstractFungible extends MultiAssetV0 {
  final Uint8List value;
  const MultiAssetV0_AllAbstractFungible({required this.value})
      : super('AllAbstractFungible');

  static MultiAssetV0_AllAbstractFungible fromMap(Map<String, dynamic> map) =>
      MultiAssetV0_AllAbstractFungible(
          value: Uint8List.fromList((map['value'] as List).cast<int>()));
}

class MultiAssetV0_AllAbstractNonFungible extends MultiAssetV0 {
  final Uint8List value;
  const MultiAssetV0_AllAbstractNonFungible({required this.value})
      : super('AllAbstractNonFungible');

  static MultiAssetV0_AllAbstractNonFungible fromMap(
          Map<String, dynamic> map) =>
      MultiAssetV0_AllAbstractNonFungible(
          value: Uint8List.fromList((map['value'] as List).cast<int>()));
}

class MultiAssetV0_AllConcreteFungible extends MultiAssetV0 {
  final MultiLocationV0 value;
  const MultiAssetV0_AllConcreteFungible({required this.value})
      : super('AllConcreteFungible');

  static MultiAssetV0_AllConcreteFungible fromMap(Map<String, dynamic> map) =>
      MultiAssetV0_AllConcreteFungible(
          value: MultiLocationV0.fromMap(map['value']));
}

class MultiAssetV0_AllConcreteNonFungible extends MultiAssetV0 {
  final MultiLocationV0 value;
  const MultiAssetV0_AllConcreteNonFungible({required this.value})
      : super('AllConcreteNonFungible');

  static MultiAssetV0_AllConcreteNonFungible fromMap(
          Map<String, dynamic> map) =>
      MultiAssetV0_AllConcreteNonFungible(
          value: MultiLocationV0.fromMap(map['value']));
}

class MultiAssetV0_AbstractFungible extends MultiAssetV0 {
  final Uint8List id;

  final BigInt instance;
  const MultiAssetV0_AbstractFungible(
      {required this.id, required this.instance})
      : super('AbstractFungible');

  static MultiAssetV0_AbstractFungible fromMap(Map<String, dynamic> map) =>
      MultiAssetV0_AbstractFungible(
          id: Uint8List.fromList((map['id'] as List).cast<int>()),
          instance: parseBigInt(map['instance']));
}

class MultiAssetV0_AbstractNonFungible extends MultiAssetV0 {
  final Uint8List classs;
  final XcmAssetInstanceV0 instance;
  const MultiAssetV0_AbstractNonFungible(
      {required this.classs, required this.instance})
      : super('AbstractNonFungible');

  static MultiAssetV0_AbstractNonFungible fromMap(Map<String, dynamic> map) =>
      MultiAssetV0_AbstractNonFungible(
          classs: Uint8List.fromList((map['class'] as List).cast<int>()),
          instance: XcmAssetInstanceV0.fromMap(map['instance']));
}

class MultiAssetV0_ConcreteFungible extends MultiAssetV0 {
  final MultiLocationV0 id;
  final BigInt amount;
  const MultiAssetV0_ConcreteFungible({required this.id, required this.amount})
      : super('ConcreteFungible');

  static MultiAssetV0_ConcreteFungible fromMap(Map<String, dynamic> map) =>
      MultiAssetV0_ConcreteFungible(
        id: MultiLocationV0.fromMap(map['id']),
        amount: parseBigInt(map['amount']),
      );
}

class MultiAssetV0_ConcreteNonFungible extends MultiAssetV0 {
  final MultiLocationV0 classs;
  final XcmAssetInstanceV0 instance;
  const MultiAssetV0_ConcreteNonFungible(
      {required this.classs, required this.instance})
      : super('ConcreteNonFungible');

  static MultiAssetV0_ConcreteNonFungible fromMap(Map<String, dynamic> map) =>
      MultiAssetV0_ConcreteNonFungible(
          classs: MultiLocationV0.fromMap(map['class']),
          instance: XcmAssetInstanceV0.fromMap(map['instance']));
}
