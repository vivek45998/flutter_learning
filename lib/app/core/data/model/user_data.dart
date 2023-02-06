class UserDataInfo {
  UserDataInfo({
     this.message,
     this.userProfile,
  });

  String? message;
  UserProfile ?userProfile;

  factory UserDataInfo.fromJson(Map<String, dynamic> json) =>UserDataInfo(
    message: json["message"],
    userProfile: UserProfile.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "userProfile": userProfile?.toJson(),
  };
}

class UserProfile{
  UserProfile({
 this.fullName,
this.username,
  this.email,
    this.date,
  this.id,
  this.token,
  });

  String ?fullName;
  String? username;
  String ?email;
  DateTime? date;
  String ?id;
  String ?token;

  factory UserProfile.fromJson(Map<String, dynamic> json) => UserProfile(
    fullName: json["fullName"],
    username: json["username"],
    email: json["email"],
    date: DateTime.parse(json["date"]),
    id: json["id"],
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "fullName": fullName,
    "username": username,
    "email": email,
    "date": date?.toIso8601String(),
    "id": id,
    "token": token,
  };
}