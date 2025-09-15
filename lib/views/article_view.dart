import 'package:assignment_app/controllers/article_controller.dart';
import 'package:assignment_app/models/article_model.dart';
import 'package:assignment_app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ArticleView extends StatelessWidget {
  final ArticleController postController = Get.find<ArticleController>();

  @override
  Widget build(BuildContext context) {
    postController.fetchPosts();

    return Scaffold(
      appBar: AppBar(title: Text("Articles")),
      body: Obx(() {
        if (postController.isLoading.value) {
          //DATA LOADING
          return Center(child: CircularProgressIndicator());
        }
        if (postController.loadingError.value.isNotEmpty) {
          //STATUS CODE != 200 or ERROR
          return Center(
            child: Text(
              "${postController.loadingError.value}",
              style: TextStyle(color: Colors.red),
            ),
          );
        }
        return ListView.builder(
          itemCount: postController.posts.value.length,
          itemBuilder: (context, index) {
            final ArticleModel model = postController.posts.value[index];
            return Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(4),
                    bottomRight: Radius.circular(25),
                    bottomLeft: Radius.circular(4)
                )
              ),
              margin: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                child: ListTile(
                  title: Text(
                    "${model.title}",
                    maxLines: 1,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    "${model.body}",
                    maxLines: 2,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                  ),
                  onTap: (){
                    Get.toNamed( Routes.ARTICLE_DETAILS_VIEW, arguments: model );
                  },
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
