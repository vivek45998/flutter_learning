import 'dart:convert';

import 'package:flutter_lerning_with_rest_api/app/core/data/local_storage/local_storage.dart';
import 'package:flutter_lerning_with_rest_api/app/core/data/model/register_response_model.dart';
import 'package:flutter_lerning_with_rest_api/app/core/data/model/user_data.dart';
import 'package:flutter_lerning_with_rest_api/app/core/values/app_strings.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../values/network_string.dart';
import '../model/user_list_model.dart';

extension RemoteRepo on GetxController {

  /// get user list
  getUserDetailWithAuthToken() async {
    var response = await http.get(
      Uri.parse(NetworkConstants.userListApi),
      headers: <String, String>{
        NetworkConstants.contentTypeKey: NetworkConstants.contentTypeValue,
       NetworkConstants.authorizationKey: "Basic ${DataStorage.getData(DataStorage.tokenId)}"
      },
    );

    if (response.statusCode == 200) {
      var data = List<UserData>.from(
          json.decode(response.body).map((x) => UserData.fromJson(x)));
      print("data=====$data");
      return data;
    } else {
      print("error====${response.body}");
      throw Exception(NetworkConstants.errorException);
    }
  }
///user login
  userLogin({required Map<String, String> userData}) async {
    var response = await http.post(
      Uri.parse(NetworkConstants.userLoginApi),
      headers: <String, String>{
    NetworkConstants.contentTypeKey: NetworkConstants.contentTypeValue,
      },
      body: jsonEncode(userData),
    );
    if (response.statusCode == 200) {
      var data = UserDataInfo.fromJson(jsonDecode(response.body));
      return data;
    } else {
      throw Exception(NetworkConstants.loginException);
    }
  }
/// update user
  updateUserData(Map<String, String> userData) async {
    print(userData["id"]);
    var response = await http.put(
      Uri.parse("${NetworkConstants.userUpdateApi}/${userData["id"]}"),
      headers: <String, String>{
        NetworkConstants.contentTypeKey: NetworkConstants.contentTypeValue,
        NetworkConstants.authorizationKey: "Basic ${DataStorage.getData(DataStorage.tokenId)}"
      },
      body: jsonEncode(userData),
    );
    print(response.body);
    if (response.statusCode == 200) {
      var data = UserData.fromJson(jsonDecode(response.body));
      return data;
    } else {
      print("error====${response.body}");
      throw Exception(NetworkConstants.errorException);
    }
  }
  deleteUser(data) async {
    var response = await http.delete(
      Uri.parse("${NetworkConstants.userDeleteApi}/${data.id}"),
      headers: <String, String>{
        NetworkConstants.contentTypeKey: NetworkConstants.contentTypeValue,
        NetworkConstants.authorizationKey: "Basic ${DataStorage.getData(DataStorage.tokenId)}"
      },
      body: jsonEncode(data),
    );
    print(response.body);
    if (response.statusCode == 200) {
      var data = UserData.fromJson(jsonDecode(response.body));
      return data;
    } else {
      print("error====${response.body}");
      throw Exception(NetworkConstants.errorException);
    }
  }
  userRegister(Map<String, String> userData) async {
    var response = await http.post(
      Uri.parse(NetworkConstants.userRegisterApi),
      headers: <String, String>{
        NetworkConstants.contentTypeKey: NetworkConstants.contentTypeValue,
      },
      body: jsonEncode(userData),
    );
    if (response.statusCode == 200) {
      var data = UserRegisterResponse.fromJson(jsonDecode(response.body));
      return data;
    } else {
      throw Exception(NetworkConstants.errorException);
    }
  }
}
