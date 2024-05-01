part of 'home_bloc_bloc.dart';

@immutable
sealed class HomeBlocState {}

abstract class HomeBlocActionState extends HomeBlocState {}

final class HomeBlocInitial extends HomeBlocState {}

class HomeLoadingState extends HomeBlocState {}

class HomeLoadingSucessState extends HomeBlocState {
  final List<ProductDataModel> products;
  HomeLoadingSucessState({required this.products});
}

class HomeErrorLoadingState extends HomeBlocState {}

class HomeNavigateToWishlistactionState extends HomeBlocActionState {}

class HomeNavigateToCartActionState extends HomeBlocActionState {}

class HomeProductwishlistedActionstate extends HomeBlocActionState {}

class HomeProductCartedActionstate extends HomeBlocActionState {}
