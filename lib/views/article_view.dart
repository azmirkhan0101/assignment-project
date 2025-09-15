import 'package:assignment_app/controllers/article_controller.dart';
import 'package:assignment_app/models/article_model.dart';
import 'package:assignment_app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ArticleView extends StatelessWidget {
  final ArticleController articleController = Get.find<ArticleController>();
  final ScrollController scrollController = ScrollController();

  ArticleView({super.key}) {
    scrollController.addListener(() {
      if (scrollController.position.pixels >=
              scrollController.position.maxScrollExtent - 100 &&
          articleController.hasMoreData.value &&
          !articleController.isMoreLoading.value) {
        articleController.fetchArticles(); // load next 15 items
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text("Articles")),
      body: Obx(() {
        //DATA LOADING
        if (articleController.isLoading.value == true &&
            articleController.currentPage.value == 1) {
          return Center(child: CircularProgressIndicator());
        }
        //NO DATA FOUND
        if (articleController.displayedArticles.isEmpty == true ) {
          return Center(
            child: Text(
              "No articles available",
              style: TextStyle(color: Colors.red),
            ),
          );
        }

        return RefreshIndicator(
          onRefresh: () {
            return articleController.fetchArticles(refresh: true);
          },
          child: ListView.builder(
            controller: scrollController,
            itemCount:
                articleController.displayedArticles.length +
                (articleController.hasMoreData.value ? 1 : 0),
            itemBuilder: (context, index) {
              if (index < articleController.displayedArticles.length) {
                final ArticleModel model =
                    articleController.displayedArticles[index];
                return Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(4),
                      bottomRight: Radius.circular(25),
                      bottomLeft: Radius.circular(4),
                    ),
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
                      onTap: () {
                        Get.toNamed(
                          Routes.ARTICLE_DETAILS_VIEW,
                          arguments: model,
                        );
                      },
                    ),
                  ),
                );
              } else {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(child: CircularProgressIndicator()),
                );
              }
            },
          ),
        );
      }),
    );
  }
}
