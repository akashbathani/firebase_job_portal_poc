import 'package:firebase_job_portal_poc/controllers/company_controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class CustomAppBarController extends GetxController {
  final TextEditingController searchController = TextEditingController();
  var isSearching = false.obs;

  final CompanyController companyController = Get.find<CompanyController>();

  void toggleSearch() {
    if (isSearching.value) {
      searchController.clear();
      companyController.setSearchQuery('');
    }
    isSearching.value = !isSearching.value;
  }

  void onSearchQueryChanged(String query) {
    companyController.setSearchQuery(query);
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }
}
