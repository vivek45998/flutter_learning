class UserList {
  UserList({
     this.fullName,
    this.username,
    this.email,
    this.date,
     this.id,
  });

  String ?fullName;
  String? username;
  String ?email;
  DateTime? date;
  String ?id;

  factory UserList.fromJson(Map<String, dynamic> json) => UserList(
    fullName: json["fullName"],
    username: json["username"],
    email: json["email"],
    date: DateTime.parse(json["date"]),
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "fullName": fullName,
    "username": username,
    "email": email,
    "date": date?.toIso8601String(),
    "id": id,
  };
}
