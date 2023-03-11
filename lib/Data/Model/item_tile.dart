import 'package:assignment_3/Bloc/Cart/bloc/cart_bloc.dart';
import 'package:assignment_3/Data/Model/data.dart';
import 'package:assignment_3/service/addedItems.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ItemTile extends StatelessWidget {
  final String image;
  final String foodTitle;
  final num foodPrice;

  const ItemTile(
      {required this.image,
      required this.foodTitle,
      required this.foodPrice,
      super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        return Container(
          height: 80,
          width: MediaQuery.of(context).size.width,
          // padding: const EdgeInsets.all(0),
          child: Container(
            height: 380,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(image: NetworkImage(image))),
                  height: MediaQuery.of(context).size.height * .1,
                  width: MediaQuery.of(context).size.width * .3,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
                ),
                Container(
                  height: 50,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                          child: Container(width: 200, child: Text(foodTitle))),
                      Text(foodPrice.toString()),
                    ],
                  ),
                ),
                IconButton(
                    onPressed: () {
                      Item item = Item(
                          image: image,
                          foodTitle: foodTitle,
                          foodPrice: foodPrice);
                      addedItems.add(item);
                      BlocProvider.of<CartBloc>(context)
                          .add(GetDataButtonPressed());
                    },
                    icon: const Icon(Icons.shopping_cart)),
              ],
            ),
          ),
        );
      },
    );
  }
}
