import 'package:flutter/material.dart';

class CustomTrailingIcon extends StatelessWidget {
  final Color trailingColor;
  const CustomTrailingIcon({super.key, required this.trailingColor});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 37,
          width: 37,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: trailingColor,
            boxShadow: [
              BoxShadow(
                color: trailingColor,
                blurRadius: 8,
                offset: const Offset(0, 0),
              ),
            ],
          ),
        ),
        Positioned(
          top: (37 - 12) / 2,
          left: (37 - 12) / 2,
          child: Container(
            height: 11,
            width: 11,
            decoration: const BoxDecoration(
                shape: BoxShape.rectangle, color: Colors.white),
          ),
        ),
      ],
    );
  }
}
