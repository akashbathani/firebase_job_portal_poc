import 'package:flutter/material.dart';

class CompanyDescription extends StatelessWidget {
  const CompanyDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Description",
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey,
            fontFamily: 'Poppins',
          ),
        ),
        Text(
          "Applicants must have at least up to 10 years of design experience and must be familar with some design. Applicants must have at least up to 10 years of design experience and must be familar with some design. Applicants must have at least up to 10 years of design experience and must be familar with some design. Applicants must have at least up to 10 years of design experience and must be familar with some design.",
          style: TextStyle(
            height: 3,
            fontSize: 14,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
