class UserRegisterResponse {
  UserRegisterResponse({
   this.message,
    this.userProfile,
  });

  String? message;
  UserProfile? userProfile;

  factory UserRegisterResponse.fromJson(Map<String, dynamic> json) => UserRegisterResponse(
    message: json["message"],
    userProfile: UserProfile.fromJson(json["userProfile"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "userProfile": userProfile?.toJson(),
  };
}

class UserProfile {
  UserProfile({
    this.fullName,
    this.username,
     this.email,
    this.password,
     this.date,
     this.id,
  });

  String ?fullName;
  String ?username;
  String ?email;
  String ?password;
  DateTime? date;
  String ?id;

  factory UserProfile.fromJson(Map<String, dynamic> json) => UserProfile(
    fullName: json["fullName"],
    username: json["username"],
    email: json["email"],
    password: json["password"],
    date: DateTime.parse(json["date"]),
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "fullName": fullName,
    "username": username,
    "email": email,
    "password": password,
    "date": date?.toIso8601String(),
    "id": id,
  };
}
