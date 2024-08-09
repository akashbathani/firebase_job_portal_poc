import 'package:flutter/material.dart';

class CompanyLogo extends StatelessWidget {
  final String thumbnailUrl;

  const CompanyLogo({super.key, required this.thumbnailUrl});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: -55,
      left: MediaQuery.of(context).size.width * 0.1,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: 140,
            width: 140,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
          ),
          Positioned(
            top: 20,
            child: ClipOval(
              child: Image.network(
                thumbnailUrl,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
