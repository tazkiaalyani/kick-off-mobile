import 'dart:convert';

List<ProductEntry> productEntryFromJson(String str) => List<ProductEntry>.from(json.decode(str).map((x) => ProductEntry.fromJson(x)));

String productEntryToJson(List<ProductEntry> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductEntry {
  String id;
  String name;
  String description;
  int price;
  String category;
  String thumbnail;
  DateTime createdAt;
  bool isFeatured;
  int userId;

  ProductEntry({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.category,
    required this.thumbnail,
    required this.createdAt,
    required this.isFeatured,
    required this.userId,
  });

  factory ProductEntry.fromJson(Map<String, dynamic> json) => ProductEntry(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    price: json["price"],
    category: json["category"],
    thumbnail: json["thumbnail"] ?? "", // Mencegah error jika thumbnail null
    createdAt: DateTime.parse(json["created_at"]),
    isFeatured: json["is_featured"],
    userId: json["user_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "price": price,
    "category": category,
    "thumbnail": thumbnail,
    "created_at": createdAt.toIso8601String(),
    "is_featured": isFeatured,
    "user_id": userId,
  };
}