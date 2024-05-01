import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:bloc_statemanagment/data/cart_items.dart';
import 'package:bloc_statemanagment/data/grocery_data.dart';
import 'package:bloc_statemanagment/data/wishlist_items.dart';
import 'package:bloc_statemanagment/features/home/models/home_product_model.dart';
import 'package:meta/meta.dart';
part 'home_bloc_event.dart';
part 'home_bloc_state.dart';

class HomeBlocBloc extends Bloc<HomeBlocEvent, HomeBlocState> {
  HomeBlocBloc() : super(HomeBlocInitial()) {
    on<Homeinitialfetchevent>(homeinitialfetchevent);
    on<HomeProductwishlistbuttonclickedevent>(
        homeProductwishlistbuttonclickedevent);
    on<HomeProductcartbuttonclickedevent>(homeProductcartbuttonclickedevent);
    on<Homecartnavigateevent>(homecartnavigateevent);
    on<Homewishlistnavigateevent>(homewishlistnavigateevent);
  }

  Future<FutureOr<void>> homeinitialfetchevent(
      Homeinitialfetchevent event, Emitter<HomeBlocState> emit) async {
    emit(HomeLoadingState());
    await Future.delayed(Duration(seconds: 3));
    emit(HomeLoadingSucessState(
        products: GroceryData.groceryProducts
            .map((data) => ProductDataModel(
                category: data['category'],
                id: data['id'],
                imageUrl: data['imageUrl'],
                name: data['name'],
                price: data['price'],
                quantity: data['quantityt']))
            .toList()));
  }

  FutureOr<void> homeProductwishlistbuttonclickedevent(
      HomeProductwishlistbuttonclickedevent event,
      Emitter<HomeBlocState> emit) {
    print("product added to wishList");
    wishlistitems.add(event.wishlistmodel);
    emit(HomeProductwishlistedActionstate());
  }

  FutureOr<void> homeProductcartbuttonclickedevent(
      HomeProductcartbuttonclickedevent event, Emitter<HomeBlocState> emit) {
    print("product added to cart");
    cartitems.add(event.cartmodel);
    emit(HomeProductCartedActionstate());
  }

  FutureOr<void> homecartnavigateevent(
      Homecartnavigateevent event, Emitter<HomeBlocState> emit) {
    print("cart navigate button pressed");
    emit(HomeNavigateToCartActionState());
  }

  FutureOr<void> homewishlistnavigateevent(
      Homewishlistnavigateevent event, Emitter<HomeBlocState> emit) {
    print("wishlist button pressed");
    emit(HomeNavigateToWishlistactionState());
  }
}
