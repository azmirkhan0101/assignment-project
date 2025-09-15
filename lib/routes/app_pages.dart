import 'package:assignment_app/bindings/auth_binding.dart';
import 'package:assignment_app/bindings/article_binding.dart';
import 'package:assignment_app/bindings/download_binding.dart';
import 'package:assignment_app/views/article_details_view.dart';
import 'package:assignment_app/views/article_view.dart';
import 'package:assignment_app/views/login_view.dart';
import 'package:assignment_app/views/settings_view.dart';
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
        name: Routes.ARTICLE_VIEW,
        page: (){
          return ArticleView();
        },
    binding: ArticleBinding(),
    ),
    GetPage(
        name: Routes.ARTICLE_DETAILS_VIEW,
        page: (){
          return ArticleDetailsView();
        },
    binding: DownloadBinding()
    ),
    GetPage(name: Routes.SETTINGS_VIEW, page: (){
      return SettingsView();
    })
  ];
}