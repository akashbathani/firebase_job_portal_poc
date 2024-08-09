import 'package:firebase_job_portal_poc/models/company_schema.dart';
import 'package:firebase_job_portal_poc/views/company_detail_screen.dart';
import 'package:firebase_job_portal_poc/widgets/company_list_screen_widgets/company_trailing_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompanyListCard extends StatelessWidget {
  final CompanySchema company;
  final Color trailingColor;
  const CompanyListCard(
      {super.key, required this.company, required this.trailingColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Card(
        color: Colors.white,
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: ListTile(
          contentPadding: const EdgeInsets.all(8),
          title: Text(
            company.title.split(' ').take(2).join(' '),
            style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins'),
          ),
          subtitle: Text(
            company.title,
            style: const TextStyle(fontFamily: 'Poppins', fontSize: 12),
            maxLines: 1,
          ),
          leading: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: ClipOval(
              child: Image.network(company.thumbnailUrl),
            ),
          ),
          trailing: Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: CustomTrailingIcon(
              trailingColor: trailingColor,
            ),
          ),
          onTap: () {
            Get.bottomSheet(
              isScrollControlled: true,
              CompanyDetailScreen(company: company),
            );
          },
        ),
      ),
    );
  }
}
