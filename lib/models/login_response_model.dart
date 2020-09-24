// To parse this JSON data, do
//
//     final loginResponseModel = loginResponseModelFromJson(jsonString);

import 'dart:convert';

LoginResponseModel loginResponseModelFromJson(String str) => LoginResponseModel.fromJson(json.decode(str));

String loginResponseModelToJson(LoginResponseModel data) => json.encode(data.toJson());

class LoginResponseModel {
  LoginResponseModel({
    this.isProfComplete,
    this.data,
    this.status,
    this.message,
  });

  bool isProfComplete;
  Data data;
  int status;
  String message;

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) => LoginResponseModel(
    isProfComplete: json["isProfComplete"] == null ? null : json["isProfComplete"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
    status: json["status"] == null ? null : json["status"],
    message: json["message"] == null ? null : json["message"],
  );

  Map<String, dynamic> toJson() => {
    "isProfComplete": isProfComplete == null ? null : isProfComplete,
    "data": data == null ? null : data.toJson(),
    "status": status == null ? null : status,
    "message": message == null ? null : message,
  };
}

class Data {
  Data({
    this.userId,
    this.name,
    this.email,
    this.pass,
    this.userType,
    this.typeTitle,
    this.image,
    this.referNo,
    this.pin,
    this.purchaseAt,
    this.expireAt,
    this.isexpire,
    this.fUId,
    this.iUId,
    this.gUId,
    this.rank,
    this.noOfShop,
  });

  int userId;
  String name;
  String email;
  String pass;
  int userType;
  dynamic typeTitle;
  dynamic image;
  dynamic referNo;
  dynamic pin;
  dynamic purchaseAt;
  dynamic expireAt;
  bool isexpire;
  dynamic fUId;
  dynamic iUId;
  dynamic gUId;
  int rank;
  int noOfShop;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    userId: json["user_id"] == null ? null : json["user_id"],
    name: json["name"] == null ? null : json["name"],
    email: json["email"] == null ? null : json["email"],
    pass: json["pass"] == null ? null : json["pass"],
    userType: json["user_type"] == null ? null : json["user_type"],
    typeTitle: json["typeTitle"],
    image: json["image"],
    referNo: json["refer_no"],
    pin: json["pin"],
    purchaseAt: json["purchase_at"],
    expireAt: json["expire_at"],
    isexpire: json["isexpire"] == null ? null : json["isexpire"],
    fUId: json["f_u_id"],
    iUId: json["i_u_id"],
    gUId: json["g_u_id"],
    rank: json["rank"] == null ? null : json["rank"],
    noOfShop: json["noOfShop"] == null ? null : json["noOfShop"],
  );

  Map<String, dynamic> toJson() => {
    "user_id": userId == null ? null : userId,
    "name": name == null ? null : name,
    "email": email == null ? null : email,
    "pass": pass == null ? null : pass,
    "user_type": userType == null ? null : userType,
    "typeTitle": typeTitle,
    "image": image,
    "refer_no": referNo,
    "pin": pin,
    "purchase_at": purchaseAt,
    "expire_at": expireAt,
    "isexpire": isexpire == null ? null : isexpire,
    "f_u_id": fUId,
    "i_u_id": iUId,
    "g_u_id": gUId,
    "rank": rank == null ? null : rank,
    "noOfShop": noOfShop == null ? null : noOfShop,
  };
}
