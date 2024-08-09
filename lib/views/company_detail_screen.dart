import 'package:firebase_job_portal_poc/controllers/company_controller.dart';
import 'package:firebase_job_portal_poc/models/company_schema.dart';
import 'package:firebase_job_portal_poc/widgets/company_detail_widget/company_desc_widget.dart';
import 'package:firebase_job_portal_poc/widgets/company_detail_widget/company_header_widget.dart';
import 'package:firebase_job_portal_poc/widgets/company_detail_widget/company_info_widget.dart';
import 'package:firebase_job_portal_poc/widgets/company_detail_widget/company_logo_widget.dart';
import 'package:firebase_job_portal_poc/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompanyDetailScreen extends StatelessWidget {
  final CompanySchema company;
  final CompanyController _companyController = Get.find<CompanyController>();

  CompanyDetailScreen({super.key, required this.company});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 550,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 55),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CompanyHeader(company: company),
                        const SizedBox(height: 50),
                        const CompanyInfo(),
                        const SizedBox(height: 30),
                        const CompanyDescription(),
                      ],
                    ),
                  ),
                ),
                CustomApplyButton(
                  color:
                      _companyController.appliedCompanies.contains(company.id)
                          ? Colors.green
                          : const Color(0xFF645EFE),
                  text: _companyController.appliedCompanies.contains(company.id)
                      ? 'Already Applied'
                      : 'Apply Now',
                  onPressed:
                      _companyController.appliedCompanies.contains(company.id)
                          ? (){}
                          : () {
                              Get.back();
                              _companyController.addCompany(company.id);
                            },
                ),
              ],
            ),
          ),
          CompanyLogo(thumbnailUrl: company.thumbnailUrl),
        ],
      ),
    );
  }
}
