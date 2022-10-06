class Meta {
  String token;

  Meta({this.token = ""});

  factory Meta.fromJson(Map<String, dynamic> json) {
    return new Meta(
      token: json["token"] == null ? "" : json["token"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "token": token,
    };
  }
}
