import 'package:firebase_job_portal_poc/controllers/company_controller.dart';
import 'package:firebase_job_portal_poc/controllers/login_controller.dart';
import 'package:get/get.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());
    Get.lazyPut<CompanyController>(() => CompanyController());
  }
}
