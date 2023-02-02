import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../values/network_string.dart';
import '../model/user_list_model.dart';

extension RemoteRepo on GetxController {
  getUserDetailWithAuthToken() async {
    var response = await http.get(
      Uri.parse(NetworkConstants.userListApi),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        "Authorization": NetworkConstants.authKey
      },
    );
    //var response =  await client.get(uri);

    if (response.statusCode == 200) {
      var data=  List<UserList>.from(json.decode(response.body).map((x) => UserList.fromJson(x)));
     // var data = UserList.fromJson(jsonDecode(response.body));
      print("data=====$data");
      return data;
      // return UserListData.fromJson(jsonDecode(response.body));
    } else {
      print("error====${response.body}");
      throw Exception('Failed to load album');
    }
  }
}
