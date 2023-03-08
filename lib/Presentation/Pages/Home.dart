import 'package:assignment_3/Data/Model/item_tile.dart';
import 'package:flutter/material.dart';
import 'package:assignment_3/Data/Model/data.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Item> _items = [
    Item(id: 1, name: 'Sugar', amount: 100),
    Item(id: 2, name: 'Salt', amount: 50)
  ];

  @override
  State<Home> createState() => _HomeState();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: _items.length,
        itemBuilder: (context, index) {
          return ItemTile(
            name: _items[index].name,
            amount: _items[index].amount,
          );
        },
      ),
    );
  }
}
