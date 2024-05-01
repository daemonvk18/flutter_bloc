import 'package:bloc_statemanagment/features/home/bloc/home_bloc_bloc.dart';
import 'package:bloc_statemanagment/features/home/models/home_product_model.dart';
import 'package:flutter/material.dart';

class ProductTile extends StatelessWidget {
  const ProductTile(
      {super.key, required this.productDataModel, required this.homeBlocBloc});

  final ProductDataModel productDataModel;
  final HomeBlocBloc homeBlocBloc;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //fruit id
          //fruit image,
          Container(
            height: 200.0,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                    image: NetworkImage(productDataModel.imageUrl),
                    fit: BoxFit.cover)),
          ),
          const SizedBox(
            height: 6.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //fruit name
              Column(
                children: [
                  Text(
                    productDataModel.name,
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
                  ),
                  //fruit price
                  Text(
                    "\$" + productDataModel.price.toString(),
                    style:
                        TextStyle(fontSize: 17.0, fontWeight: FontWeight.w400),
                  )
                ],
              ),
              //add to cart or wishlist option
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                      onPressed: () {
                        homeBlocBloc.add(HomeProductwishlistbuttonclickedevent(
                            wishlistmodel: productDataModel));
                      },
                      icon: Icon(Icons.favorite_border)),
                  IconButton(
                      onPressed: () {
                        homeBlocBloc.add(HomeProductcartbuttonclickedevent(
                            cartmodel: productDataModel));
                      },
                      icon: Icon(Icons.shopping_bag_outlined)),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
