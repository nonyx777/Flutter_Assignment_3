import 'package:assignment_3/Bloc/Shop/bloc/shop_bloc.dart';
import 'package:assignment_3/Data/Model/item_tile.dart';
import 'package:assignment_3/Presentation/Pages/History.dart';
import 'package:assignment_3/Presentation/Pages/Profile.dart';
import 'package:flutter/material.dart';
import 'package:assignment_3/Data/Model/data.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int index = 0;

  final List<Item> _items = [
    Item(id: 1, name: 'Sugar'),
    Item(id: 2, name: 'Salt'),
    Item(id: 3, name: 'Apple'),
    Item(id: 3, name: 'Orange'),
    Item(id: 3, name: 'Meat'),
    Item(id: 3, name: 'Vegetables'),
    Item(id: 3, name: 'Cloth'),
    Item(id: 3, name: 'Electronics'),
  ];

  @override
  State<Home> createState() => _HomeState();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ShopBloc, ShopState>(
        builder: (context, state) {
          if (state is ShopInitialState) {
            return Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.center,
              child: ElevatedButton(
                  onPressed: () {
                    BlocProvider.of<ShopBloc>(context)
                        .add(GetDataButtonPressed());
                  },
                  child: const Text('Get Item')),
            );
          } else if (state is ShopLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ShopFailState) {
            return Text(state.message);
          } else if (state is ShopSuccessState) {
            return ListView.builder(
              itemCount: _items.length,
              itemBuilder: (context, index) {
                return ItemTile(
                  name: _items[index].name,
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


// ListView.builder(
//         itemCount: _items.length,
//         itemBuilder: (context, index) {
//           return ItemTile(
//             name: _items[index].name,
//           );
//         },
//       ),