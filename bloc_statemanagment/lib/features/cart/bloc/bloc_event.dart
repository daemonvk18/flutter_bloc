part of 'bloc_bloc.dart';

@immutable
sealed class BlocEvent {}

class CartPageIntialEvent extends BlocEvent {}

class CartPageRemoveditemEvent extends BlocEvent {}
