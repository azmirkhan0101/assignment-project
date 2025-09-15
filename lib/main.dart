import 'package:assignment_app/controllers/auth_controller.dart';
import 'package:assignment_app/routes/app_pages.dart';
import 'package:assignment_app/services/translation_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'controllers/theme_controller.dart';

void main() async {
  await GetStorage.init();
  Get.put( AuthController() );
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {

  final ThemeController themeController = Get.put(ThemeController());
  final storage = GetStorage();
  final String localeKey = 'localeKey';

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: themeController.theme,
      translations: TranslationService(), // your translations
      locale: ((storage.read(localeKey) == "english"))? Locale('en', 'US') : Locale('bn', 'BN'),
      fallbackLocale: const Locale('en', 'US'),
      getPages: AppPages.pages,
      initialRoute: Get.find<AuthController>().isLoggedIn()
          ? Routes.ARTICLE_VIEW
          : Routes.LOGIN_VIEW,
    );
  }
}
