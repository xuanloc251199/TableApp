import 'dart:convert';

List<Product> productFromJson(String str) =>
    List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String productToJson(List<Product> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Product {
  Product({
    required this.id,
    required this.idCategory,
    required this.idDiscount,
    required this.idShop,
    required this.name,
    required this.price,
    required this.description,
    required this.image,
    required this.thumbnail,
    required this.rate,
    required this.amount,
    required this.boughtAmount,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  int idCategory;
  int idDiscount;
  int idShop;
  String name;
  double price;
  String description;
  String image;
  String thumbnail;
  double rate;
  int amount;
  int boughtAmount;
  DateTime createdAt;
  DateTime updatedAt;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        idCategory: json["id_category"],
        idDiscount: json["id_discount"],
        idShop: json["id_shop"],
        name: json["name"],
        price: json["price"].toDouble(),
        description: json["description"],
        image: json["image"],
        thumbnail: json["thumbnail"],
        rate: json["rate"].toDouble(),
        amount: json["amount"],
        boughtAmount: json["bought_amount"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "id_category": idCategory,
        "id_discount": idDiscount,
        "id_shop": idShop,
        "name": name,
        "price": price,
        "description": description,
        "image": image,
        "thumbnail": thumbnail,
        "rate": rate,
        "amount": amount,
        "bought_amount": boughtAmount,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
