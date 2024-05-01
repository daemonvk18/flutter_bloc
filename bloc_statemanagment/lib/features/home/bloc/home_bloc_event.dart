part of 'home_bloc_bloc.dart';

@immutable
sealed class HomeBlocEvent {}

class Homeinitialfetchevent extends HomeBlocEvent {}

class HomeProductcartbuttonclickedevent extends HomeBlocEvent {
  final ProductDataModel cartmodel;
  HomeProductcartbuttonclickedevent({required this.cartmodel});
}

class HomeProductwishlistbuttonclickedevent extends HomeBlocEvent {
  final ProductDataModel wishlistmodel;
  HomeProductwishlistbuttonclickedevent({required this.wishlistmodel});
}

class Homecartnavigateevent extends HomeBlocEvent {}

class Homewishlistnavigateevent extends HomeBlocEvent {}
