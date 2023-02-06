class NetworkConstants {
  static const baseUrl = "http://10.10.20.52:3001/users";
  static const userListApi = "$baseUrl/user-profile";
  static const userLoginApi = "$baseUrl/login";
  static const userRegisterApi = "$baseUrl/register";
  static const userUpdateApi = "$baseUrl/update-user";
  static const userDeleteApi = "$baseUrl/delete-user";
  static const contentTypeValue="application/json; charset=UTF-8";
  static const contentTypeKey='Content-Type';
  static const authorizationKey="Authorization";

  ///autorization key
  static const authKey =
      "Basic eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjoiZGV2IiwiaWF0IjoxNjc1NDUyNDk5LCJleHAiOjE2NzU0NTk2OTl9.-XwXv2KnxWEpY82GrBc3lMccuBKUyKDRiTFPYbKKMjE";

///remote error string
static const errorException='Failed to load user data';
static const loginException="Failed to login";
}
