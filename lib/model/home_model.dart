// To parse this JSON data, do
//
//     final homeScreenModel = homeScreenModelFromJson(jsondynamic);

import 'dart:convert';

HomeScreenModel homeScreenModelFromJson(dynamic str) =>
    HomeScreenModel.fromJson(json.decode(str));

dynamic homeScreenModelToJson(HomeScreenModel data) =>
    json.encode(data.toJson());

class HomeScreenModel {
  HomeScreenModel({
    required this.success,
    required this.errorMsg,
    required this.userLocation,
    required this.latitude,
    required this.longitude,
    required this.banners,
    required this.categories,
    required this.shopData,
  });

  bool success;
  dynamic errorMsg;
  dynamic userLocation;
  dynamic latitude;
  dynamic longitude;
  List<Banner> banners;
  List<Category> categories;
  List<ShopDatum> shopData;

  factory HomeScreenModel.fromJson(Map<dynamic, dynamic> json) =>
      HomeScreenModel(
        success: json["success"],
        errorMsg: json["errorMsg"],
        userLocation: json["user_location"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        banners:
            List<Banner>.from(json["banners"].map((x) => Banner.fromJson(x))),
        categories: List<Category>.from(
            json["categories"].map((x) => Category.fromJson(x))),
        shopData: List<ShopDatum>.from(
            json["shop_data"].map((x) => ShopDatum.fromJson(x))),
      );

  Map<dynamic, dynamic> toJson() => {
        "success": success,
        "errorMsg": errorMsg,
        "user_location": userLocation,
        "latitude": latitude,
        "longitude": longitude,
        "banners": List<dynamic>.from(banners.map((x) => x.toJson())),
        "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
        "shop_data": List<dynamic>.from(shopData.map((x) => x.toJson())),
      };
}

class Banner {
  Banner({
    required this.id,
    required this.shopId,
    required this.image,
  });

  int id;
  int shopId;
  dynamic image;

  factory Banner.fromJson(Map<dynamic, dynamic> json) => Banner(
        id: json["id"],
        shopId: json["shop_id"],
        image: json["image"],
      );

  Map<dynamic, dynamic> toJson() => {
        "id": id,
        "shop_id": shopId,
        "image": image,
      };
}

class Category {
  Category({
    required this.id,
    required this.type,
    required this.imageName,
  });

  dynamic id;
  dynamic type;
  dynamic imageName;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        type: json["type"],
        imageName: json["image_name"] ?? "null",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "image_name": imageName,
      };
}

class ShopDatum {
  ShopDatum({
    required this.id,
    required this.name,
    required this.phone,
    required this.alternatePhone,
    required this.email,
    required this.address,
    required this.pinCode,
    required this.location,
    required this.latitude,
    required this.longitude,
    required this.isActive,
    required this.description,
    required this.radius,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
  });

  dynamic id;
  dynamic name;
  dynamic phone;
  dynamic alternatePhone;
  dynamic email;
  dynamic address;
  dynamic pinCode;
  dynamic location;
  dynamic latitude;
  dynamic longitude;
  dynamic isActive;
  dynamic description;
  dynamic radius;
  dynamic image;
  DateTime createdAt;
  DateTime updatedAt;

  factory ShopDatum.fromJson(Map<dynamic, dynamic> json) => ShopDatum(
        id: json["id"],
        name: json["name"],
        phone: json["phone"],
        alternatePhone: json["alternate_phone"],
        email: json["email"],
        address: json["address"],
        pinCode: json["pin_code"],
        location: json["location"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        isActive: json["is_active"],
        description: json["description"],
        radius: json["radius"],
        image: json["image"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "phone": phone,
        "alternate_phone": alternatePhone,
        "email": email,
        "address": address,
        "pin_code": pinCode,
        "location": location,
        "latitude": latitude,
        "longitude": longitude,
        "is_active": isActive,
        "description": description,
        "radius": radius,
        "image": image,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
