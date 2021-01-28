class GroceryModel {
  final String name;
  final String category;
  final String sub_category;
  final List qty;
  final List unit;

  GroceryModel({this.name, this.category, this.sub_category, this.qty, this.unit});

  factory GroceryModel.fromJson(Map<String, dynamic> json) {
    return GroceryModel(
        name: json['name'],
        category: json['category'],
        sub_category: json['sub_category'],
        qty: json['qty'],
        unit: json['unit']
    );
  }
}