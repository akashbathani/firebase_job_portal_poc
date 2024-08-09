import 'package:firebase_job_portal_poc/models/company_schema.dart';
import 'package:flutter/material.dart';

class CompanyHeader extends StatelessWidget {
  final CompanySchema company;

  const CompanyHeader({super.key, required this.company});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              company.title.split(' ').take(2).join(' '),
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins',
              ),
            ),
            const Icon(
              Icons.star,
              color: Colors.grey,
              size: 24,
            ),
          ],
        ),
        const SizedBox(height: 10),
        const Text(
          "Sificon Vales, CA",
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey,
            fontFamily: 'Poppins',
          ),
        ),
        const SizedBox(height: 5),
        const Text(
          "Tech-based company and the producer",
          style: TextStyle(
            fontSize: 13,
            color: Colors.grey,
            fontFamily: 'Poppins',
          ),
        ),
      ],
    );
  }
}
