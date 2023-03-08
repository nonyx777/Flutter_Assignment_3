import 'dart:ffi';

class Item {
  int id;
  String name;
  int amount;

  Item({
    required this.id,
    required this.name,
    required this.amount,
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      id: json['id'],
      name: json.containsKey('name') ? json['name'] : '',
      amount: json.containsKey('amount') ? json['amount'] : '',
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};

    json['id'] = id;
    json['name'] = name;
    json['amount'] = amount;

    return json;
  }
}
