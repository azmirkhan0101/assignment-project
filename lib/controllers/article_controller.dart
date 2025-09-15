import 'dart:convert';

import 'package:assignment_app/models/article_model.dart';
import 'package:assignment_app/utils/api_endpoints.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ArticleController extends GetxController {
  var posts = <ArticleModel>[].obs;
  var isLoading = true.obs;
  var loadingError = ''.obs;

  void fetchPosts() async {
    try{
      http.Response response = await http.get(
        Uri.parse(ApiEndpoints.POSTS_URL),
        headers: {
          'accept':'application/json'
        }
      );

      if (response.statusCode == 200) {
        List tempPosts = jsonDecode(response.body);
        posts.value = tempPosts.map((postJson) {
          return ArticleModel(
            userId: postJson['userId'],
            id: postJson['id'],
            title: postJson['title'],
            body: postJson['body'],
          );
        }).toList();
        loadingError.value = '';
      }else{
        loadingError.value = 'Something went wrong!';
      }
    }catch(e){
      loadingError.value = 'Something went wrong!';
    }

    isLoading.value = false;

  }
}
