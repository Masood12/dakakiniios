// To parse this JSON data, do
//
//     final submitReview = submitReviewFromJson(jsonString);

import 'dart:convert';

SubmitReview submitReviewFromJson(String str) => SubmitReview.fromJson(json.decode(str));

String submitReviewToJson(SubmitReview data) => json.encode(data.toJson());

class SubmitReview {
    SubmitReview({
        this.data,
        this.status,
        this.message,
    });

    Data data;
    int status;
    String message;

    factory SubmitReview.fromJson(Map<String, dynamic> json) => SubmitReview(
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
        this.rvId,
        this.byId,
        this.toid,
        this.value,
        this.dtm,
        this.comments,
        this.tblShops,
        this.tblUser,
    });

    int rvId;
    int byId;
    int toid;
    int value;
    DateTime dtm;
    String comments;
    dynamic tblShops;
    dynamic tblUser;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        rvId: json["rv_id"] == null ? null : json["rv_id"],
        byId: json["by_id"] == null ? null : json["by_id"],
        toid: json["toid"] == null ? null : json["toid"],
        value: json["value"] == null ? null : json["value"],
        dtm: json["dtm"] == null ? null : DateTime.parse(json["dtm"]),
        comments: json["comments"] == null ? null : json["comments"],
        tblShops: json["tbl_shops"],
        tblUser: json["tbl_user"],
    );

    Map<String, dynamic> toJson() => {
        "rv_id": rvId == null ? null : rvId,
        "by_id": byId == null ? null : byId,
        "toid": toid == null ? null : toid,
        "value": value == null ? null : value,
        "dtm": dtm == null ? null : dtm.toIso8601String(),
        "comments": comments == null ? null : comments,
        "tbl_shops": tblShops,
        "tbl_user": tblUser,
    };
}
