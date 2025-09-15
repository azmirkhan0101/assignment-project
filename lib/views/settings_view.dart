import 'package:assignment_app/controllers/theme_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsView extends StatelessWidget {

  final ThemeController themeController = Get.find<ThemeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
      ),
      body: Column(
        children: [
          DropdownButton<String>(
            hint: Text("Select Language"),
            items: [
              DropdownMenuItem(value: "english", child: Text("English")),
              DropdownMenuItem(value: "bengali", child: Text("বাংলা")),
            ],
            onChanged: (value) {
              if (value == "english") {
                Get.updateLocale(Locale('en', 'US'));
              }else{
                Get.updateLocale(Locale('bn', 'BN'));
              }
            },
          ),
          ElevatedButton(onPressed: (){
            themeController.switchTheme();
          }, child: Text("Change Theme"))
        ],
      )
    );
  }
}
