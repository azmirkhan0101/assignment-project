import 'package:assignment_app/controllers/auth_controller.dart';
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
              DropdownButton<String>(
                hint: Text("Select Language"),
                items: [
                  DropdownMenuItem(value: "english", child: Text("English")),
                  DropdownMenuItem(value: "bengali", child: Text("বাংলা")),
                ],
                onChanged: (value) {
                  if (value != null) {
                    //Get.updateLocale(Locale(value));
                  }
                },
              ),
              Icon(Icons.login, size: 80,),
              SizedBox(
                height: 10,
              ),
              Text("Login Page", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blue),),
              SizedBox(
                height: 15,
              ),
              //EMAIL
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 10),
                child: TextField(
                  controller: authController.emailController,
                  decoration: InputDecoration(
                    hintText: "email",
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
                    hintText: "password",
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
                  child: Text("Login", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),),
              onPressed: () async{
                  await authController.loginUser();
                  bool isSuccess = authController.errorMessage.isEmpty;//NO ERROR
                  showSnackBar(
                      title: isSuccess? "Successfully Logged In" : "Login Failed!",
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
