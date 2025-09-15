import 'package:assignment_app/models/article_model.dart';
import 'package:assignment_app/services/api_service.dart';
import 'package:get/get.dart';

class ArticleController extends GetxController {
  final ApiService service = ApiService();

  var allArticles = <ArticleModel>[]; // full data from API
  var displayedArticles = <ArticleModel>[].obs; // items to show in list

  var isLoading = true.obs;
  var isMoreLoading = false.obs;

  final int itemsPerPage = 15; // 15 items per "page"
  var currentPage = 1.obs;
  var hasMoreData = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchArticles(refresh: true);
  }

  fetchArticles({bool refresh = false}) async {
    if (refresh) {
      isLoading.value = true;
      currentPage.value = 1;
      hasMoreData.value = true;
      displayedArticles.clear();
      allArticles = await service.fetchAllArticles();
    }

    int start = (currentPage.value - 1) * itemsPerPage;
    int end = start + itemsPerPage;

    if (start >= allArticles.length) {
      hasMoreData.value = false;
      isLoading.value = false;
      isMoreLoading.value = false;
      return;
    }

    List<ArticleModel> pageItems = allArticles.sublist(
      start,
      end > allArticles.length ? allArticles.length : end,
    );

    displayedArticles.addAll(pageItems);

    if (end >= allArticles.length) {
      hasMoreData.value = false;
    } else {
      currentPage.value++;
    }

  }
}
