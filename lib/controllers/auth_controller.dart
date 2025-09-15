import 'dart:convert';

import 'package:assignment_app/routes/app_pages.dart';
import 'package:assignment_app/utils/api_endpoints.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class AuthController extends GetxController{

  var errorMessage = ''.obs;
  final storage = GetStorage();
  final loginCheckingKey = 'login_checking_key';
  final tokenKey = 'token_key';
  bool isLoggedIn(){
    return storage.read( loginCheckingKey ) ?? false;
  }

  String getToken(){
    return storage.read( tokenKey ) ?? '';
  }

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> loginUser() async{
    var headers = {'Content-Type':'application/json',
      'x-api-key': 'reqres-free-v1'
    };
    Map body = {
      "email": emailController.text,
      "password": passwordController.text
    };
     http.Response response = await http.post( Uri.parse( ApiEndpoints.LOGIN_URL ),
         body: jsonEncode( body ), headers: headers);

    final json = jsonDecode( response.body );
     if( response.statusCode == 200 ) { //LOGIN SUCCESS
       storage.write( loginCheckingKey, true );
       storage.write( tokenKey, json['token']);
       emailController.clear();
       passwordController.clear();
       Get.offAllNamed(Routes.ARTICLE_VIEW);
     }

     errorMessage.value = json['error'] ?? '';//HANDLES ALL THE ERRORS

  }
}