class Item {
  int id;
  String name;

  Item({
    required this.id,
    required this.name,
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      id: json['participants'],
      name: json.containsKey('activity') ? json['activity'] : '',
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};

    json['id'] = id;
    json['name'] = name;

    return json;
  }
}
