import 'package:firebase_job_portal_poc/bindings/company_binding.dart';
import 'package:firebase_job_portal_poc/bindings/login_binding.dart';
import 'package:firebase_job_portal_poc/models/company_schema.dart';
import 'package:firebase_job_portal_poc/views/company_detail_screen.dart';
import 'package:firebase_job_portal_poc/views/company_list_screen.dart';
import 'package:firebase_job_portal_poc/views/login_screen.dart';
import 'package:get/get.dart';

class AppRoutes {
  static const String login = '/login';
  static const String companyList = '/company-list';
  static const String companyDetail = '/company-detail';

  static String initialRoute(bool isLoggedIn) {
    return isLoggedIn ? companyList : login;
  }

  static routes(bool isLoggedIn) {
    return [
      GetPage(
        name: login,
        page: () => LoginView(),
        binding: LoginBinding(),
      ),
      GetPage(
        name: companyList,
        page: () => CompanyListScreen(),
        binding: CompanyBinding(),
      ),
      GetPage(
        name: companyDetail,
        page: () => CompanyDetailScreen(
          company: Get.arguments as CompanySchema,
        ),
      ),
    ];
  }
}
