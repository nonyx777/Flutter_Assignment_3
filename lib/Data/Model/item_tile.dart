import 'dart:ffi';

import 'package:flutter/material.dart';

class ItemTile extends StatelessWidget {
  final String name;
  final int amount;

  const ItemTile({required this.name, required this.amount, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(name),
              const SizedBox(height: 2),
              Text(amount.toString()),
              const SizedBox(height: 2),
            ],
          ),
          IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
        ],
      ),
    );
  }
}
