import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/core/values/app_colors.dart';
import 'app/core/values/app_strings.dart';
import 'app/routes/app_pages.dart';
import 'app/routes/app_routes.dart';

Future<void> main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      enableLog: true,
      getPages: AppPages.pages,
      title: AppStrings.appName,
      initialRoute: AppRoutes.splashPage,
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.cupertino,
      themeMode: ThemeMode.system,
      darkTheme: ThemeData(
        // primarySwatch: Colors.blue,
        checkboxTheme: CheckboxThemeData(
          checkColor: MaterialStateProperty.all(Colors.white),
          fillColor: MaterialStateProperty.all(AppColors.colorApp),
        ),
      ),
      theme: ThemeData(
        // primarySwatch: Colors.blue,
        checkboxTheme: CheckboxThemeData(
          checkColor: MaterialStateProperty.all(Colors.white),
          fillColor: MaterialStateProperty.all(AppColors.colorApp),
        ),
      ),
    );
  }
}

