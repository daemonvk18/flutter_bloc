import 'package:bloc_statemanagment/features/cart/bloc/bloc_bloc.dart';
import 'package:bloc_statemanagment/features/cart/ui/carttile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final BlocBloc cartBloc = BlocBloc();
  @override
  void initState() {
    cartBloc.add(CartPageIntialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("C A R T P A G E"),
      ),
      body: BlocConsumer<BlocBloc, BlocState>(
        bloc: cartBloc,
        listener: (context, state) {},
        listenWhen: (previous, current) => current is BlocActionState,
        buildWhen: (previous, current) => current is! BlocActionState,
        builder: (context, state) {
          switch (state.runtimeType) {
            case CartSuccessState:
              final successState = state as CartSuccessState;
              return ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: successState.cartproducts.length,
                  itemBuilder: ((context, index) {
                    return CartTile(
                      productDataModel: successState.cartproducts[index],
                      cartBloc: cartBloc,
                    );
                  }));

            default:
          }
          return Container();
        },
      ),
    );
  }
}
