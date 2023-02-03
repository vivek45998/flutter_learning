import 'dart:convert';

import 'package:flutter_lerning_with_rest_api/app/core/data/local_storage/local_storage.dart';
import 'package:flutter_lerning_with_rest_api/app/core/data/model/user_data.dart';
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
        "Authorization": "Basic ${DataStorage.getData(DataStorage.tokenId)}"
      },
    );

    if (response.statusCode == 200) {
      var data = List<UserList>.from(
          json.decode(response.body).map((x) => UserList.fromJson(x)));
      print("data=====$data");
      return data;
    } else {
      print("error====${response.body}");
      throw Exception('Failed to load album');
    }
  }

  userLogin({required Map<String, String> userData}) async {
    var response = await http.post(
      Uri.parse(NetworkConstants.userLoginApi),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(userData),
    );
    if (response.statusCode == 200) {
      var data = UserData.fromJson(jsonDecode(response.body));
      return data;
    } else {
      throw Exception("Failed to login");
    }
  }

  updateUserData(data) async {
    var response = await http.put(
      Uri.parse("${NetworkConstants.userUpdateApi}/${data.id}"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        "Authorization": "Basic ${DataStorage.getData(DataStorage.tokenId)}"
      },
      body: jsonEncode(data),
    );
    print(response.body);
    if (response.statusCode == 200) {
      var data = UserList.fromJson(jsonDecode(response.body));
      return data;
    } else {
      print("error====${response.body}");
      throw Exception('Failed to load album');
    }
  }
}
