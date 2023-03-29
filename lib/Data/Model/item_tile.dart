import 'package:assignment_3/Bloc/Cart/bloc/cart_bloc.dart';
import 'package:assignment_3/Data/Model/data.dart';
import 'package:assignment_3/Repository/service.dart';
import 'package:assignment_3/service/addedItems.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ItemTile extends StatelessWidget {
  final int id;
  final String image;
  final String title;
  final num price;
  final bool cartButtonPressed;

  const ItemTile(
      {required this.id,
      required this.image,
      required this.title,
      required this.price,
      required this.cartButtonPressed,
      super.key});

  @override
  Widget build(BuildContext context) {
    final _service = Service();
    const String dollar_sign = "\$";
    int index_to_remove = 0;
    bool item_to_remove_found = false;
    double total_price = 0;
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        return Container(
          color: Color.fromARGB(255, 253, 247, 247),
          height: 80,
          width: MediaQuery.of(context).size.width,
          child: Container(
            height: 380,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(image: NetworkImage(image)),
                    color: Colors.white,
                  ),
                  height: MediaQuery.of(context).size.height * .1,
                  width: MediaQuery.of(context).size.width * .3,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
                ),
                Container(
                  height: 50,
                  color: Colors.white10,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                          child: Container(width: 200, child: Text(title))),
                      Text(dollar_sign + price.toString()),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {
                    if (!cartButtonPressed) {
                      //Converting it into an item object
                      Item item = Item(
                          id: id, image: image, title: title, price: price);
                      //saving to database
                      _service.saveItem(item);
                      // addedItems.add(item);

                      calculatePrice(); //self explanatory
                      BlocProvider.of<CartBloc>(context)
                          .add(GetDataButtonPressed());
                    } else {
                      Item item = Item(
                        id: id,
                        image: image,
                        title: title,
                        price: price,
                      );
                      // for (int i = 0;
                      //     i < addedItems.length &&
                      //         item_to_remove_found == false;
                      //     i++) {
                      //   if (item.id == addedItems[i].id) {
                      //     index_to_remove = i;
                      //     item_to_remove_found = true;
                      //   }
                      // }
                      // item_to_remove_found = false;
                      // addedItems.removeAt(
                      //     index_to_remove); //removes it from the list of the cart
                      _service.deleteItem(
                          item.id); //deletes the item from the database
                      calculatePrice();
                      BlocProvider.of<CartBloc>(context)
                          .add(RemoveDataButtonPressed());
                    }
                  },
                  icon: cartButtonPressed
                      ? const Icon(Icons.remove_shopping_cart)
                      : const Icon(Icons.shopping_cart),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

//calculate the total price
void calculatePrice() {
  totalPrice = 0;
  for (int i = 0; i < addedItems.length; i++) {
    totalPrice += addedItems[i].price;
    //fix the precision to 2 decimal numbers
    String stringTotalPrice = totalPrice.toStringAsFixed(2);
    //cast back to double
    totalPrice = double.parse(stringTotalPrice);
  }
}
