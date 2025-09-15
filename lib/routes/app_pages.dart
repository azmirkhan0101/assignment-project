import 'package:assignment_app/bindings/auth_binding.dart';
import 'package:assignment_app/views/article_list_view.dart';
import 'package:assignment_app/views/login_view.dart';
import 'package:get/get.dart';
part 'app_routes.dart';

class AppPages{
  static final pages = [
    GetPage(
        name: Routes.LOGIN_VIEW,
        page: (){
          return LoginView();
        }
        ),
    GetPage(
        name: Routes.ARTICLE_LIST_VIEW,
        page: (){
          return ArticleListView();
        })
  ];
}