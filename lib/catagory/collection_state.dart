import 'package:wineapp/model/Bottle.dart';

abstract class CollectionState {}

class BottleInitial extends CollectionState {}

class BottleLoading extends CollectionState {}

class BottleLoaded extends CollectionState {
  final List<Bottle> bottles;

  BottleLoaded(this.bottles);
}

class BottleError extends CollectionState {
  final String message;

  BottleError(this.message);
}
