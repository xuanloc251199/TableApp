import 'dart:convert';

List<Shop> shopFromJson(String str) =>
    List<Shop>.from(json.decode(str).map((x) => Shop.fromJson(x)));

String shopToJson(List<Shop> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Shop {
  Shop({
    required this.id,
    required this.name,
    required this.address,
    required this.avt,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String name;
  String address;
  String avt;
  DateTime createdAt;
  DateTime updatedAt;

  factory Shop.fromJson(Map<String, dynamic> json) => Shop(
        id: json["id"],
        name: json["name"],
        address: json["address"],
        avt: json["avt"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "address": address,
        "avt": avt,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
