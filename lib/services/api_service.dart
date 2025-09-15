import 'dart:convert';

import 'package:assignment_app/models/article_model.dart';
import 'package:assignment_app/utils/api_endpoints.dart';
import 'package:http/http.dart' as http;

class ApiService {

  Future<List<ArticleModel>> fetchAllArticles() async {
    try {
      final response = await http.get(Uri.parse( ApiEndpoints.POSTS_URL ),
          headers: {
            'Accept': 'application/json'
          });

      if (response.statusCode == 200) {
        List tempArticlesJson = json.decode( response.body );
        return tempArticlesJson.map((articleJson){
          return ArticleModel(
              userId: articleJson['userId'],
              id: articleJson['id'],
              title: articleJson['title'],
              body: articleJson['body']
          );
        }).toList(); // returns full list
      } else {
        throw Exception("Failed to load articles");
      }
    } catch (e) {
      return [];
    }
  }
}
