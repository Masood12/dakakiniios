/* Upload Image Model */
class UploadImageModel {
  UploadImageModel({
    this.status,
    this.message,
    this.data,
  });

  int status;
  String message;
  String data;

  factory UploadImageModel.fromJson(Map<String, dynamic> json) =>
      UploadImageModel(
        status: json["status"] == null ? null : json["status"],
        message: json["message"] == null ? null : json["message"],
        data: json["data"] == null ? null : json["data"],
      );

  Map<String, dynamic> toJson() => {
        "status": status == null ? null : status,
        "message": message == null ? null : message,
        "data": data == null ? null : data,
      };
}


