import 'package:firebase_job_portal_poc/controllers/company_controller.dart';
import 'package:get/get.dart';

class CompanyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CompanyController>(() => CompanyController());
  }
}
