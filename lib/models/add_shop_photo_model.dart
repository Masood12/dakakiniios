// To parse this JSON data, do
//
//     final addShopPhoto = addShopPhotoFromJson(jsonString);

import 'dart:convert';

AddShopPhoto addShopPhotoFromJson(String str) => AddShopPhoto.fromJson(json.decode(str));

String addShopPhotoToJson(AddShopPhoto data) => json.encode(data.toJson());

class AddShopPhoto {
    AddShopPhoto({
        this.data,
        this.status,
        this.message,
    });

    Data data;
    int status;
    String message;

    factory AddShopPhoto.fromJson(Map<String, dynamic> json) => AddShopPhoto(
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
        this.id,
        this.shopId,
        this.ownerId,
        this.photo,
    });

    int id;
    int shopId;
    int ownerId;
    String photo;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"] == null ? null : json["id"],
        shopId: json["shop_id"] == null ? null : json["shop_id"],
        ownerId: json["owner_id"] == null ? null : json["owner_id"],
        photo: json["photo"] == null ? null : json["photo"],
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "shop_id": shopId == null ? null : shopId,
        "owner_id": ownerId == null ? null : ownerId,
        "photo": photo == null ? null : photo,
    };
}
