
class SignUp {
    SignUp({
        this.status,
        this.message,
    });

    int status;
    String message;

    factory SignUp.fromJson(Map<String, dynamic> json) => SignUp(
        status: json["status"] == null ? null : json["status"],
        message: json["message"] == null ? null : json["message"],
    );

    Map<String, dynamic> toJson() => {
        "status": status == null ? null : status,
        "message": message == null ? null : message,
    };
}
