import 'package:assignment_app/controllers/article_controller.dart';
import 'package:get/get.dart';

class ArticleBinding extends Bindings{
  @override
  void dependencies() {
    Get.put( ArticleController() );
  }

}