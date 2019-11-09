class Ingredient {
  final String value;
  final String name;

  Ingredient({this.value, this.name});

  factory Ingredient.fromJson(Map<String, dynamic> json) {
    return Ingredient(name: json['name'], value: json['value']);
  }
}
