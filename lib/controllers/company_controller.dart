import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_job_portal_poc/models/company_schema.dart';
import 'package:firebase_job_portal_poc/services/company_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompanyController extends GetxController {
  var isLoading = true.obs;
  var companies = <CompanySchema>[].obs;
  var appliedCompanies = <int>[].obs;
  var filteredCompanies = <CompanySchema>[].obs;
  var searchQuery = ''.obs;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  void onInit() {
    super.onInit();
    fetchCompanies();
    loadAppliedCompanies();
  }

  void fetchCompanies() async {
    try {
      isLoading(true);
      var companyList = await CompanyService.fetchCompanies();
      companies.assignAll(companyList);
      filteredCompanies.assignAll(companyList);
      updateFilteredCompanies();
    } catch (e) {
      Get.snackbar('Error', 'An error occurred while fetching companies');
    } finally {
      isLoading(false);
    }
  }

  void loadAppliedCompanies() async {
    try {
      User? user = _auth.currentUser;
      if (user != null) {
        DocumentSnapshot userDoc =
            await _firestore.collection('users').doc(user.uid).get();

        if (userDoc.exists) {
          List<dynamic> appliedList = userDoc['appliedCompanies'] ?? [];
          appliedCompanies.value = appliedList.map((e) => e as int).toList();
          updateFilteredCompanies();
        }
      }
    } catch (e) {
      Get.snackbar(
          'Error', 'An error occurred while loading applied companies');
    }
  }

  void addCompany(int companyId) async {
    User? user = _auth.currentUser;
    bool isSuccess = false;

    if (user != null && !appliedCompanies.contains(companyId)) {
      appliedCompanies.add(companyId);

      await _firestore.collection('users').doc(user.uid).update({
        'appliedCompanies': FieldValue.arrayUnion([companyId])
      });

      updateFilteredCompanies();
      isSuccess = true;
    }

    handlePostApplyActions(isSuccess);
  }

  void setSearchQuery(String query) {
    searchQuery.value = query;
    filterCompanies(query);
    updateFilteredCompanies();
  }

  void updateFilteredCompanies() {
    filteredCompanies.value = companies.where((company) {
      return company.title
          .toLowerCase()
          .contains(searchQuery.value.toLowerCase());
    }).toList();
  }

  void filterCompanies(String query) {
    if (query.isEmpty) {
      filteredCompanies.assignAll(companies);
    } else {
      filteredCompanies.assignAll(
        companies
            .where((company) =>
                company.title.toLowerCase().contains(query.toLowerCase()))
            .toList(),
      );
    }
  }

  void handlePostApplyActions(bool isSuccess) {
    if (isSuccess) {
      Get.back();
      Get.snackbar(
          colorText: Colors.white,
          backgroundColor: Colors.green,
          'Success',
          'Job Applied Successfully');
    } else {
      Get.snackbar(
        colorText: Colors.white,
        backgroundColor: Colors.red,
        'Notice',
        'You have already applied to this job',
      );
    }
  }
}
