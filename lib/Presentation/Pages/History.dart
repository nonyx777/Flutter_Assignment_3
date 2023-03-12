import 'package:assignment_3/Bloc/Cart/bloc/cart_bloc.dart';
import 'package:assignment_3/Data/Model/data.dart';
import 'package:assignment_3/Data/Model/item_tile.dart';
import 'package:assignment_3/service/addedItems.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state is CartInitialState) {
            return Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.center,
              child: const Text("No Items Added to Cart"),
            );
          } else if (state is CartLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CartFailState) {
            return Text(state.message);
          } else if (state is CartSuccessState) {
            return ListView.builder(
              itemCount: state.item.length,
              itemBuilder: (context, index) {
                final Item itemVal = state.item[index];
                return ItemTile(
                  image: itemVal.image,
                  foodTitle: itemVal.foodTitle,
                  foodPrice: itemVal.foodPrice,
                  cartButtonPressed: true,
                );
              },
            );
          }
          return Container();
        },
      ),
    );
  }
}
