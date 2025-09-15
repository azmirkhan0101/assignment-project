import 'package:assignment_app/controllers/theme_controller.dart';
import 'package:assignment_app/utils/locale_keys.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SettingsView extends StatelessWidget {

  final ThemeController themeController = Get.find<ThemeController>();
  final storage = GetStorage();
  final String localeKey = 'localeKey';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text( LocaleKeys.settings.tr ),
      ),
      body: Column(
        children: [
          DropdownButton<String>(
            hint: Text( LocaleKeys.selectLanguage.tr ),
            items: [
              DropdownMenuItem(value: "english", child: Text("English")),
              DropdownMenuItem(value: "bengali", child: Text("বাংলা")),
            ],
            onChanged: (value) {
              if (value == "english") {
                Get.updateLocale(Locale('en', 'US'));
                storage.write( localeKey, "english");
              }else{
                Get.updateLocale(Locale('bn', 'BN'));
                storage.write( localeKey, "bengali");
              }
            },
          ),
          ElevatedButton(onPressed: (){
            themeController.switchTheme();
          }, child: Text( LocaleKeys.changeTheme.tr ))
        ],
      )
    );
  }
}
