import 'package:bloc_statemanagment/features/cart/ui/cartpage.dart';
import 'package:bloc_statemanagment/features/home/bloc/home_bloc_bloc.dart';
import 'package:bloc_statemanagment/features/home/ui/product_tile.dart';
import 'package:bloc_statemanagment/features/wishlist/ui/wishlistpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final HomeBlocBloc homeBloc = HomeBlocBloc();
  @override
  void initState() {
    homeBloc.add(Homeinitialfetchevent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBlocBloc, HomeBlocState>(
      bloc: homeBloc,
      listenWhen: (previous, current) => current is HomeBlocActionState,
      buildWhen: (previous, current) => current is! HomeBlocActionState,
      listener: (context, state) {
        if (state is HomeNavigateToCartActionState) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => CartPage()));
        } else if (state is HomeNavigateToWishlistactionState) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => WishListPage()));
        } else if (state is HomeProductwishlistedActionstate) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("item wishlisted"),
            duration: Duration(seconds: 1),
          ));
        } else if (state is HomeProductCartedActionstate) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("item carted"),
            duration: Duration(seconds: 1),
          ));
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case HomeLoadingState:
            return Scaffold(
              backgroundColor: Theme.of(context).primaryColor,
              body: Center(
                  child: CircularProgressIndicator(
                color: Colors.white,
              )),
            );
          case HomeLoadingSucessState:
            final sucessstate = state as HomeLoadingSucessState;
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Theme.of(context).primaryColor,
                title: Text(
                  "G R O C E R Y  A P P",
                  style: TextStyle(color: Colors.white),
                ),
                centerTitle: false,
                actions: [
                  IconButton(
                      onPressed: () {
                        homeBloc.add(Homewishlistnavigateevent());
                      },
                      icon: Icon(
                        Icons.favorite_border,
                        color: Colors.white,
                      )),
                  IconButton(
                      onPressed: () {
                        homeBloc.add(Homecartnavigateevent());
                      },
                      icon: Icon(
                        Icons.shopping_bag_outlined,
                        color: Colors.white,
                      ))
                ],
              ),
              body: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: sucessstate.products.length,
                  itemBuilder: ((context, index) {
                    return ProductTile(
                      productDataModel: sucessstate.products[index],
                      homeBlocBloc: homeBloc,
                    );
                  })),
            );
          case HomeErrorLoadingState:
            return Scaffold(
              body: Center(
                child: Text("Unexpected error occured while fetching the data"),
              ),
            );
          default:
            return SizedBox();
        }
      },
    );
  }
}
