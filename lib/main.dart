import 'package:assignment_app/controllers/auth_controller.dart';
import 'package:assignment_app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  Get.put( AuthController() );
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: AppPages.pages,
      initialRoute: Get.find<AuthController>().isLoggedIn()
          ? Routes.ARTICLE_LIST_VIEW
          : Routes.LOGIN_VIEW,
    );
  }
}
