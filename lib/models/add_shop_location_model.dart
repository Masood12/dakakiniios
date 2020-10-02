// To parse this JSON data, do
//
//     final addShopLocationModel = addShopLocationModelFromJson(jsonString);

import 'dart:convert';

AddShopLocationModel addShopLocationModelFromJson(String str) => AddShopLocationModel.fromJson(json.decode(str));

String addShopLocationModelToJson(AddShopLocationModel data) => json.encode(data.toJson());

class AddShopLocationModel {
    AddShopLocationModel({
        this.data,
        this.status,
        this.message,
    });

    Data data;
    int status;
    String message;

    factory AddShopLocationModel.fromJson(Map<String, dynamic> json) => AddShopLocationModel(
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
        this.userId,
        this.lat,
        this.lng,
        this.address,
        this.tblShops,
        this.tblUser,
        this.tblUser1,
    });

    int id;
    int shopId;
    int userId;
    double lat;
    double lng;
    String address;
    dynamic tblShops;
    dynamic tblUser;
    dynamic tblUser1;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"] == null ? null : json["id"],
        shopId: json["shop_id"] == null ? null : json["shop_id"],
        userId: json["user_id"] == null ? null : json["user_id"],
        lat: json["lat"] == null ? null : json["lat"].toDouble(),
        lng: json["lng"] == null ? null : json["lng"].toDouble(),
        address: json["address"] == null ? null : json["address"],
        tblShops: json["tbl_shops"],
        tblUser: json["tbl_user"],
        tblUser1: json["tbl_user1"],
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "shop_id": shopId == null ? null : shopId,
        "user_id": userId == null ? null : userId,
        "lat": lat == null ? null : lat,
        "lng": lng == null ? null : lng,
        "address": address == null ? null : address,
        "tbl_shops": tblShops,
        "tbl_user": tblUser,
        "tbl_user1": tblUser1,
    };
}
