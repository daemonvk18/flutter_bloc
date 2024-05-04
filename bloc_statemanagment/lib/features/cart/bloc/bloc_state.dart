part of 'bloc_bloc.dart';

@immutable
sealed class BlocState {}

abstract class BlocActionState extends BlocState {}

final class BlocInitial extends BlocState {}

class CartSuccessState extends BlocState {
  final List<ProductDataModel> cartproducts;

  CartSuccessState({required this.cartproducts});
}

class CartProductRemovedState extends BlocActionState {}
