import 'package:assignment_app/controllers/auth_controller.dart';
import 'package:assignment_app/utils/locale_keys.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginView extends StatelessWidget {

  final AuthController authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.login, size: 80,),
              SizedBox(
                height: 10,
              ),
              Text(LocaleKeys.loginPage.tr, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blue),),
              SizedBox(
                height: 15,
              ),
              //EMAIL
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 10),
                child: TextField(
                  controller: authController.emailController,
                  decoration: InputDecoration(
                    hintText: LocaleKeys.email.tr,
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              //PASSWORD
              Padding(
                padding: const EdgeInsets.fromLTRB(35, 0, 35, 20),
                child: TextField(
                  controller: authController.passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: LocaleKeys.password.tr,
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              //LOGIN BUTTON
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 45, vertical: 15),
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))
                ),
                  child: Text(LocaleKeys.login.tr, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),),
              onPressed: () async{
                  await authController.loginUser();
                  bool isSuccess = authController.errorMessage.isEmpty;//NO ERROR
                  showSnackBar(
                      title: isSuccess? LocaleKeys.loginSuccess.tr : LocaleKeys.loginFailed.tr,
                      message: isSuccess? "Welcome back! Your login was successful." : authController.errorMessage.value,
                      isSuccess: isSuccess);
              },),
            ],
          ),
        ),
      ),
    );
  }

  void showSnackBar({required String title, required String message,required bool isSuccess}){
    Get.snackbar(
    title,
        message,
    backgroundColor: isSuccess? Colors.green : Colors.red,
      colorText: Colors.white
    );
  }
}
