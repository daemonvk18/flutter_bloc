part of 'bloc_bloc.dart';

@immutable
sealed class BlocEvent {}

class CartPageIntialEvent extends BlocEvent {}

class CartPageRemoveditemEvent extends BlocEvent {
  final ProductDataModel productdatamodel;

  CartPageRemoveditemEvent({required this.productdatamodel});
}
