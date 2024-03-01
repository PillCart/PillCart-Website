// To parse this JSON data, do
//
//     final medicines = medicinesFromJson(jsonString);

import 'dart:convert';

List<Medicines> medicinesFromJson(String str) => List<Medicines>.from(json.decode(str).map((x) => Medicines.fromJson(x)));

String medicinesToJson(List<Medicines> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Medicines {
  int id;
  String tradeName;
  int genericNameId;
  int categoryId;
  int companyId;
  int price;
  int Show;
  int amount;
  int expiringYear;
  int expiringMonth;
  int expiringDay;
  DateTime createdAt;
  DateTime updatedAt;
  Category category;
  Category company;
  Category genericName;

  Medicines({
    required this.id,
    required this.tradeName,
    required this.genericNameId,
    required this.categoryId,
    required this.companyId,
    required this.price,
    required this.Show,
    required this.amount,
    required this.expiringYear,
    required this.expiringMonth,
    required this.expiringDay,
    required this.createdAt,
    required this.updatedAt,
    required this.category,
    required this.company,
    required this.genericName,
  });

  factory Medicines.fromJson(Map<String, dynamic> json) => Medicines(
        tradeName: json["tradeName"],
        price: json["price"],
        amount: json["amount"],
        Show: json["Show"],
        expiringYear: json["expiringYear"],
        expiringMonth: json["expiringMonth"],
        expiringDay: json["expiringDay"],
        categoryId: json["category_id"],
        companyId: json["company_id"],
        genericNameId: json["generic_name_id"],
        updatedAt: DateTime.parse(json["updated_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        category: Category.fromJson(json["category"]),
        company: Category.fromJson(json["company"]),
        genericName: Category.fromJson(json["generic_name"]),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "tradeName": tradeName,
        "generic_name_id": genericNameId,
        "category_id": categoryId,
        "company_id": companyId,
        "price": price,
        "Show": Show,
        "amount": amount,
        "expiringYear": expiringYear,
        "expiringMonth": expiringMonth,
        "expiringDay": expiringDay,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "category": category.toJson(),
        "company": company.toJson(),
        "generic_name": genericName.toJson(),
      };
}

class Category {
  int id;
  String name;
  DateTime createdAt;
  DateTime updatedAt;

  Category({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
