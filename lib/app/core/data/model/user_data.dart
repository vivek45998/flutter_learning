class UserData {
  UserData({
     this.message,
     this.data,
  });

  String? message;
  Data ?data;

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "data": data?.toJson(),
  };
}

class Data {
  Data({
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

  factory Data.fromJson(Map<String, dynamic> json) => Data(
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