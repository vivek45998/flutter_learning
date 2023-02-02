import 'package:flutter_lerning_with_rest_api/app/presentation/common/splash/splash_page/splash_page.dart';
import 'package:flutter_lerning_with_rest_api/app/presentation/user/login/login_page/login_page.dart';
import 'package:flutter_lerning_with_rest_api/app/presentation/user/register_page/register_page.dart';
import 'package:flutter_lerning_with_rest_api/app/presentation/user/user_list/page/user_list_page.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(name: AppRoutes.splashPage, page: () => SplashPage()),
    GetPage(name: AppRoutes.userList, page: () =>  UserListPage()),
    GetPage(name: AppRoutes.loginPage, page: () =>  LoginPage()),
    GetPage(name: AppRoutes.registerPage, page: () => RegisterPage()),

  ];
}