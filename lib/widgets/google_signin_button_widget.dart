import 'package:firebase_job_portal_poc/controllers/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GoogleSignInButton extends StatelessWidget {
  final LoginController loginController;

  const GoogleSignInButton({super.key, required this.loginController});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 50,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFF4e54c8),
            Color(0xFF8f94fb),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
        borderRadius: BorderRadius.circular(50),
      ),
      child: Obx(() {
        return OutlinedButton.icon(
          icon: Image.asset(
            'assets/images/google.png',
            height: 24,
            width: 24,
          ),
          onPressed: loginController.isLoading.value
              ? null
              : () {
                  loginController.signInWithGoogle();
                },
          style: OutlinedButton.styleFrom(
            side: BorderSide.none,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          label: const Text(
            'Sign In With Google',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        );
      }),
    );
  }
}
