import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:bloc_statemanagment/data/cart_items.dart';
import 'package:bloc_statemanagment/features/home/models/home_product_model.dart';
import 'package:meta/meta.dart';
part 'bloc_event.dart';
part 'bloc_state.dart';

class BlocBloc extends Bloc<BlocEvent, BlocState> {
  BlocBloc() : super(BlocInitial()) {
    on<CartPageIntialEvent>(cartPageIntialEvent);
    on<CartPageRemoveditemEvent>(cartPageRemoveditemEvent);
  }

  FutureOr<void> cartPageIntialEvent(
      CartPageIntialEvent event, Emitter<BlocState> emit) {
    emit(CartSuccessState(cartproducts: cartitems));
  }

  FutureOr<void> cartPageRemoveditemEvent(
      CartPageRemoveditemEvent event, Emitter<BlocState> emit) {
    //cartitems.remove(value);
  }
}
