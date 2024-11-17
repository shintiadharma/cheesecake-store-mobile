import 'dart:convert';

// Fungsi untuk memparsing JSON dari String
List<ProductEntry> productEntryFromJson(String str) =>
    List<ProductEntry>.from(json.decode(str).map((x) => ProductEntry.fromJson(x)));

String productEntryToJson(List<ProductEntry> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductEntry {
  String model;
  String pk;
  Fields fields;

  ProductEntry({
    required this.model,
    required this.pk,
    required this.fields,
  });

  factory ProductEntry.fromJson(Map<String, dynamic> json) => ProductEntry(
        model: json["model"],
        pk: json["pk"].toString(),
        fields: Fields.fromJson(json["fields"]),
      );

  Map<String, dynamic> toJson() => {
        "model": model,
        "pk": pk,
        "fields": fields.toJson(),
      };
}

class Fields {
  int user;
  String name;
  String size;
  int price;
  String description;
  String notes;

  Fields({
    required this.user,
    required this.name,
    required this.size,
    required this.price,
    required this.description,
    required this.notes,
  });

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        user: json["user"] ?? 0,
        name: json["name"] ?? '',
        size: json["size"] ?? '',
        price: json["price"] ?? 0,
        description: json["description"] ?? '',
        notes: json["notes"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "user": user,
        "name": name,
        "size": size,
        "price": price,
        "description": description,
        "notes": notes,
      };
}