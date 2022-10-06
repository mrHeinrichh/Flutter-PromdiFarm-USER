class User {
  final String firstName;
  final String lastName;
  final String email;
  final List roles;
  final bool deleted;
  final String otp;

  User({
    this.firstName = "",
    this.lastName = "",
    this.email = "",
    required this.roles,
    this.deleted = false,
    this.otp = "",
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return new User(
      firstName: json["firstName"] == null ? json["firstName"] : "",
      lastName: json["lastName"] == null ? json["lastName"] : "",
      email: json["email"] == null ? json["email"] : "",
      roles: json["roles"] == null ? json["roles"] : [],
      deleted: json["deleted"] == null ? json["deleted"] : false,
      otp: json["otp"] == null ? json["otp"] : "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "firstName": firstName,
      "lastName": lastName,
      "email": email,
      "roles": roles,
      "deleted": deleted,
      "otp": otp
    };
  }
}
