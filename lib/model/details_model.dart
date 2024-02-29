// To parse this JSON data, do
//
//     final shopDetailsModel = shopDetailsModelFromJson(jsonString);

import 'dart:convert';

ShopDetailsModel shopDetailsModelFromJson(String str) =>
    ShopDetailsModel.fromJson(json.decode(str));

String shopDetailsModelToJson(ShopDetailsModel data) =>
    json.encode(data.toJson());

class ShopDetailsModel {
  ShopDetailsModel({
    required this.success,
    required this.errorMsg,
    required this.banners,
    required this.categories,
    required this.products,
  });

  dynamic success;
  dynamic errorMsg;
  List<Banners> banners;
  List<Categorys> categories;
  List<Products> products;

  factory ShopDetailsModel.fromJson(Map<String, dynamic> json) =>
      ShopDetailsModel(
        success: json["success"],
        errorMsg: json["errorMsg"],
        banners:
            List<Banners>.from(json["banners"].map((x) => Banners.fromJson(x))),
        categories: List<Categorys>.from(
            json["categories"].map((x) => Categorys.fromJson(x))),
        products: List<Products>.from(
            json["products"].map((x) => Products.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "errorMsg": errorMsg,
        "banners": List<dynamic>.from(banners.map((x) => x.toJson())),
        "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
      };
}

class Banners {
  Banners({
    required this.id,
    required this.shopId,
    required this.image,
  });

  dynamic id;
  dynamic shopId;
  dynamic image;

  factory Banners.fromJson(Map<String, dynamic> json) => Banners(
        id: json["id"],
        shopId: json["shop_id"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "shop_id": shopId,
        "image": image,
      };
}

class Categorys {
  Categorys({
    required this.id,
    required this.category,
    required this.image,
  });

  dynamic id;
  dynamic category;
  dynamic image;

  factory Categorys.fromJson(Map<String, dynamic> json) => Categorys(
        id: json["id"] ?? "",
        category: json["category"] ?? "",
        image: json["image"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "category": category,
        "image": image,
      };
}

class Products {
  Products({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.salePrice,
    required this.unit,
    required this.stock,
    required this.category,
    this.subCategory,
    required this.status,
    required this.featured,
    required this.isNew,
    required this.featuredImage,
    required this.walletAmount,
    required this.discount,
    required this.isWishlist,
    required this.isCart,
    required this.attributes,
    required this.quantity,
    required this.createdAt,
    required this.updatedAt,
  });

  dynamic id;
  dynamic name;
  dynamic description;
  dynamic price;
  dynamic salePrice;
  dynamic unit;
  dynamic stock;
  dynamic category;
  dynamic subCategory;
  dynamic status;
  dynamic featured;
  dynamic isNew;
  dynamic featuredImage;
  dynamic walletAmount;
  dynamic discount;
  dynamic isWishlist;
  dynamic isCart;
  List<Attribute> attributes;
  dynamic quantity;
  dynamic createdAt;
  dynamic updatedAt;

  factory Products.fromJson(Map<String, dynamic> json) => Products(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        price: json["price"],
        salePrice: json["sale_price"],
        unit: json["unit"],
        stock: json["stock"],
        category: json["category"],
        subCategory: json["sub_category"],
        status: json["status"],
        featured: json["featured"],
        isNew: json["is_new"],
        featuredImage: json["featured_image"],
        walletAmount: json["wallet_amount"],
        discount: json["discount"],
        isWishlist: json["is_wishlist"],
        isCart: json["is_cart"],
        attributes: List<Attribute>.from(
            json["attributes"].map((x) => Attribute.fromJson(x))),
        quantity: json["quantity"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "price": price,
        "sale_price": salePrice,
        "unit": unit,
        "stock": stock,
        "category": category,
        "sub_category": subCategory,
        "status": status,
        "featured": featured,
        "is_new": isNew,
        "featured_image": featuredImage,
        "wallet_amount": walletAmount,
        "discount": discount,
        "is_wishlist": isWishlist,
        "is_cart": isCart,
        "attributes": List<dynamic>.from(attributes.map((x) => x.toJson())),
        "quantity": quantity,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

class Attribute {
  Attribute({
    required this.name,
    required this.value,
    required this.id,
  });
  dynamic id;
  dynamic name;
  dynamic value;

  factory Attribute.fromJson(Map<String, dynamic> json) => Attribute(
        name: json["name"],
        id: json["id"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "value": value,
      };
}
