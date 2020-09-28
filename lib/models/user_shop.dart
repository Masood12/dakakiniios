// To parse this JSON data, do
//
//     final userShop = userShopFromJson(jsonString);

import 'dart:convert';

UserShop userShopFromJson(String str) => UserShop.fromJson(json.decode(str));

String userShopToJson(UserShop data) => json.encode(data.toJson());

class UserShop {
    UserShop({
        this.data,
        this.status,
        this.message,
    });

    List<Datum> data;
    int status;
    String message;

    factory UserShop.fromJson(Map<String, dynamic> json) => UserShop(
        data: json["data"] == null ? null : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        status: json["status"] == null ? null : json["status"],
        message: json["message"] == null ? null : json["message"],
    );

    Map<String, dynamic> toJson() => {
        "data": data == null ? null : List<dynamic>.from(data.map((x) => x.toJson())),
        "status": status == null ? null : status,
        "message": message == null ? null : message,
    };
}

class Datum {
    Datum({
        this.shopId,
        this.name,
        this.subTitle,
        this.description,
        this.featureImg,
        this.userId,
        this.catId,
        this.catTitle,
        this.cityId,
        this.cityTitle,
        this.countryId,
        this.countryTitle,
        this.ownerInfo,
        this.shopDetail,
        this.shopPhotoes,
        this.shopMenu,
        this.shopLocation,
        this.shopNotification,
        this.shopReview,
    });

    int shopId;
    String name;
    String subTitle;
    String description;
    String featureImg;
    int userId;
    int catId;
    String catTitle;
    int cityId;
    String cityTitle;
    int countryId;
    String countryTitle;
    OwnerInfo ownerInfo;
    ShopDetail shopDetail;
    List<ShopPhotoe> shopPhotoes;
    List<ShopMenu> shopMenu;
    List<ShopLocation> shopLocation;
    List<ShopNotification> shopNotification;
    List<ShopReview> shopReview;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        shopId: json["shop_id"] == null ? null : json["shop_id"],
        name: json["name"] == null ? null : json["name"],
        subTitle: json["sub_title"] == null ? null : json["sub_title"],
        description: json["description"] == null ? null : json["description"],
        featureImg: json["feature_img"] == null ? null : json["feature_img"],
        userId: json["user_id"] == null ? null : json["user_id"],
        catId: json["cat_id"] == null ? null : json["cat_id"],
        catTitle: json["catTitle"] == null ? null : json["catTitle"],
        cityId: json["city_id"] == null ? null : json["city_id"],
        cityTitle: json["cityTitle"] == null ? null : json["cityTitle"],
        countryId: json["country_id"] == null ? null : json["country_id"],
        countryTitle: json["countryTitle"] == null ? null : json["countryTitle"],
        ownerInfo: json["ownerInfo"] == null ? null : OwnerInfo.fromJson(json["ownerInfo"]),
        shopDetail: json["shopDetail"] == null ? null : ShopDetail.fromJson(json["shopDetail"]),
        shopPhotoes: json["shopPhotoes"] == null ? null : List<ShopPhotoe>.from(json["shopPhotoes"].map((x) => ShopPhotoe.fromJson(x))),
        shopMenu: json["shopMenu"] == null ? null : List<ShopMenu>.from(json["shopMenu"].map((x) => ShopMenu.fromJson(x))),
        shopLocation: json["shopLocation"] == null ? null : List<ShopLocation>.from(json["shopLocation"].map((x) => ShopLocation.fromJson(x))),
        shopNotification: json["shopNotification"] == null ? null : List<ShopNotification>.from(json["shopNotification"].map((x) => ShopNotification.fromJson(x))),
        shopReview: json["shopReview"] == null ? null : List<ShopReview>.from(json["shopReview"].map((x) => ShopReview.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "shop_id": shopId == null ? null : shopId,
        "name": name == null ? null : name,
        "sub_title": subTitle == null ? null : subTitle,
        "description": description == null ? null : description,
        "feature_img": featureImg == null ? null : featureImg,
        "user_id": userId == null ? null : userId,
        "cat_id": catId == null ? null : catId,
        "catTitle": catTitle == null ? null : catTitle,
        "city_id": cityId == null ? null : cityId,
        "cityTitle": cityTitle == null ? null : cityTitle,
        "country_id": countryId == null ? null : countryId,
        "countryTitle": countryTitle == null ? null : countryTitle,
        "ownerInfo": ownerInfo == null ? null : ownerInfo.toJson(),
        "shopDetail": shopDetail == null ? null : shopDetail.toJson(),
        "shopPhotoes": shopPhotoes == null ? null : List<dynamic>.from(shopPhotoes.map((x) => x.toJson())),
        "shopMenu": shopMenu == null ? null : List<dynamic>.from(shopMenu.map((x) => x.toJson())),
        "shopLocation": shopLocation == null ? null : List<dynamic>.from(shopLocation.map((x) => x.toJson())),
        "shopNotification": shopNotification == null ? null : List<dynamic>.from(shopNotification.map((x) => x.toJson())),
        "shopReview": shopReview == null ? null : List<dynamic>.from(shopReview.map((x) => x.toJson())),
    };
}

class OwnerInfo {
    OwnerInfo({
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
    dynamic pass;
    int userType;
    String typeTitle;
    dynamic image;
    dynamic referNo;
    dynamic pin;
    DateTime purchaseAt;
    DateTime expireAt;
    bool isexpire;
    dynamic fUId;
    dynamic iUId;
    dynamic gUId;
    int rank;
    int noOfShop;

    factory OwnerInfo.fromJson(Map<String, dynamic> json) => OwnerInfo(
        userId: json["user_id"] == null ? null : json["user_id"],
        name: json["name"] == null ? null : json["name"],
        email: json["email"] == null ? null : json["email"],
        pass: json["pass"],
        userType: json["user_type"] == null ? null : json["user_type"],
        typeTitle: json["typeTitle"] == null ? null : json["typeTitle"],
        image: json["image"],
        referNo: json["refer_no"],
        pin: json["pin"],
        purchaseAt: json["purchase_at"] == null ? null : DateTime.parse(json["purchase_at"]),
        expireAt: json["expire_at"] == null ? null : DateTime.parse(json["expire_at"]),
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
        "pass": pass,
        "user_type": userType == null ? null : userType,
        "typeTitle": typeTitle == null ? null : typeTitle,
        "image": image,
        "refer_no": referNo,
        "pin": pin,
        "purchase_at": purchaseAt == null ? null : purchaseAt.toIso8601String(),
        "expire_at": expireAt == null ? null : expireAt.toIso8601String(),
        "isexpire": isexpire == null ? null : isexpire,
        "f_u_id": fUId,
        "i_u_id": iUId,
        "g_u_id": gUId,
        "rank": rank == null ? null : rank,
        "noOfShop": noOfShop == null ? null : noOfShop,
    };
}

class ShopDetail {
    ShopDetail({
        this.id,
        this.shopId,
        this.userId,
        this.phone,
        this.cellNo,
        this.email,
        this.website,
        this.openAt,
        this.closeAt,
    });

    int id;
    int shopId;
    int userId;
    String phone;
    String cellNo;
    String email;
    String website;
    DateTime openAt;
    DateTime closeAt;

    factory ShopDetail.fromJson(Map<String, dynamic> json) => ShopDetail(
        id: json["id"] == null ? null : json["id"],
        shopId: json["shop_id"] == null ? null : json["shop_id"],
        userId: json["user_id"] == null ? null : json["user_id"],
        phone: json["phone"] == null ? null : json["phone"],
        cellNo: json["cell_no"] == null ? null : json["cell_no"],
        email: json["email"] == null ? null : json["email"],
        website: json["website"] == null ? null : json["website"],
        openAt: json["open_at"] == null ? null : DateTime.parse(json["open_at"]),
        closeAt: json["close_at"] == null ? null : DateTime.parse(json["close_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "shop_id": shopId == null ? null : shopId,
        "user_id": userId == null ? null : userId,
        "phone": phone == null ? null : phone,
        "cell_no": cellNo == null ? null : cellNo,
        "email": email == null ? null : email,
        "website": website == null ? null : website,
        "open_at": openAt == null ? null : openAt.toIso8601String(),
        "close_at": closeAt == null ? null : closeAt.toIso8601String(),
    };
}

class ShopLocation {
    ShopLocation({
        this.id,
        this.shopId,
        this.userId,
        this.lat,
        this.lng,
        this.address,
    });

    int id;
    int shopId;
    int userId;
    double lat;
    double lng;
    String address;

    factory ShopLocation.fromJson(Map<String, dynamic> json) => ShopLocation(
        id: json["id"] == null ? null : json["id"],
        shopId: json["shop_id"] == null ? null : json["shop_id"],
        userId: json["user_id"] == null ? null : json["user_id"],
        lat: json["lat"] == null ? null : json["lat"].toDouble(),
        lng: json["lng"] == null ? null : json["lng"].toDouble(),
        address: json["address"] == null ? null : json["address"],
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "shop_id": shopId == null ? null : shopId,
        "user_id": userId == null ? null : userId,
        "lat": lat == null ? null : lat,
        "lng": lng == null ? null : lng,
        "address": address == null ? null : address,
    };
}

class ShopMenu {
    ShopMenu({
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

    factory ShopMenu.fromJson(Map<String, dynamic> json) => ShopMenu(
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

class ShopNotification {
    ShopNotification({
        this.notId,
        this.byId,
        this.byUser,
        this.title,
        this.body,
        this.dtm,
        this.isdeleted,
    });

    int notId;
    int byId;
    int byUser;
    String title;
    String body;
    DateTime dtm;
    bool isdeleted;

    factory ShopNotification.fromJson(Map<String, dynamic> json) => ShopNotification(
        notId: json["not_id"] == null ? null : json["not_id"],
        byId: json["byId"] == null ? null : json["byId"],
        byUser: json["by_user"] == null ? null : json["by_user"],
        title: json["title"] == null ? null : json["title"],
        body: json["body"] == null ? null : json["body"],
        dtm: json["dtm"] == null ? null : DateTime.parse(json["dtm"]),
        isdeleted: json["isdeleted"] == null ? null : json["isdeleted"],
    );

    Map<String, dynamic> toJson() => {
        "not_id": notId == null ? null : notId,
        "byId": byId == null ? null : byId,
        "by_user": byUser == null ? null : byUser,
        "title": title == null ? null : title,
        "body": body == null ? null : body,
        "dtm": dtm == null ? null : dtm.toIso8601String(),
        "isdeleted": isdeleted == null ? null : isdeleted,
    };
}

class ShopPhotoe {
    ShopPhotoe({
        this.id,
        this.shopId,
        this.ownerId,
        this.photo,
    });

    int id;
    int shopId;
    int ownerId;
    String photo;

    factory ShopPhotoe.fromJson(Map<String, dynamic> json) => ShopPhotoe(
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

class ShopReview {
    ShopReview({
        this.rvId,
        this.byId,
        this.byName,
        this.byImg,
        this.toid,
        this.value,
        this.dtm,
        this.comments,
    });

    int rvId;
    int byId;
    String byName;
    dynamic byImg;
    int toid;
    int value;
    DateTime dtm;
    String comments;

    factory ShopReview.fromJson(Map<String, dynamic> json) => ShopReview(
        rvId: json["rv_id"] == null ? null : json["rv_id"],
        byId: json["by_id"] == null ? null : json["by_id"],
        byName: json["byName"] == null ? null : json["byName"],
        byImg: json["byImg"],
        toid: json["toid"] == null ? null : json["toid"],
        value: json["value"] == null ? null : json["value"],
        dtm: json["dtm"] == null ? null : DateTime.parse(json["dtm"]),
        comments: json["comments"] == null ? null : json["comments"],
    );

    Map<String, dynamic> toJson() => {
        "rv_id": rvId == null ? null : rvId,
        "by_id": byId == null ? null : byId,
        "byName": byName == null ? null : byName,
        "byImg": byImg,
        "toid": toid == null ? null : toid,
        "value": value == null ? null : value,
        "dtm": dtm == null ? null : dtm.toIso8601String(),
        "comments": comments == null ? null : comments,
    };
}
