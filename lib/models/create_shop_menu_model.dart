// To parse this JSON data, do
//
//     final createShopMenu = createShopMenuFromJson(jsonString);

import 'dart:convert';

CreateShopMenu createShopMenuFromJson(String str) => CreateShopMenu.fromJson(json.decode(str));

String createShopMenuToJson(CreateShopMenu data) => json.encode(data.toJson());

class CreateShopMenu {
    CreateShopMenu({
        this.data,
        this.status,
        this.message,
    });

    Data data;
    int status;
    String message;

    factory CreateShopMenu.fromJson(Map<String, dynamic> json) => CreateShopMenu(
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        status: json["status"] == null ? null : json["status"],
        message: json["message"] == null ? null : json["message"],
    );

    Map<String, dynamic> toJson() => {
        "data": data == null ? null : data.toJson(),
        "status": status == null ? null : status,
        "message": message == null ? null : message,
    };
}

class Data {
    Data({
        this.menuId,
        this.title,
        this.shopId,
        this.userId,
        this.description,
        this.img,
        this.price,
    });

    int menuId;
    String title;
    int shopId;
    int userId;
    String description;
    String img;
    String price;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        menuId: json["menu_id"] == null ? null : json["menu_id"],
        title: json["title"] == null ? null : json["title"],
        shopId: json["shop_id"] == null ? null : json["shop_id"],
        userId: json["user_id"] == null ? null : json["user_id"],
        description: json["description"] == null ? null : json["description"],
        img: json["img"] == null ? null : json["img"],
        price: json["price"] == null ? null : json["price"],
    );

    Map<String, dynamic> toJson() => {
        "menu_id": menuId == null ? null : menuId,
        "title": title == null ? null : title,
        "shop_id": shopId == null ? null : shopId,
        "user_id": userId == null ? null : userId,
        "description": description == null ? null : description,
        "img": img == null ? null : img,
        "price": price == null ? null : price,
    };
}
