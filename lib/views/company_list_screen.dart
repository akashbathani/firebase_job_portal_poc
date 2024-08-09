import 'package:firebase_job_portal_poc/controllers/company_controller.dart';
import 'package:firebase_job_portal_poc/widgets/company_list_screen_widgets/company_list_card_widget.dart';
import 'package:firebase_job_portal_poc/widgets/company_list_screen_widgets/custom_appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompanyListScreen extends StatelessWidget {
  final CompanyController companyController = Get.find<CompanyController>();

  CompanyListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.98),
      appBar: const CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
        child: Column(
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Find your Dream \nJob today',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Poppins',
                ),
              ),
            ),
            const SizedBox(height: 12),
            Obx(() {
              if (companyController.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              }
              if (companyController.filteredCompanies.isEmpty) {
                return const Center(
                    child: Align(
                        alignment: Alignment.center,
                        child: Text('No companies found')));
              }
              return Expanded(
                child: ListView.builder(
                  itemCount: companyController.filteredCompanies.length,
                  itemBuilder: (context, index) {
                    final company = companyController.filteredCompanies[index];
                    final bool isApplied =
                        companyController.appliedCompanies.contains(company.id);
                    final Color trailingColor =
                        isApplied ? Colors.green : const Color(0xFF645EFE);
                    return CompanyListCard(
                      company: company,
                      trailingColor: trailingColor,
                    );
                  },
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
