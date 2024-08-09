import 'package:firebase_job_portal_poc/controllers/login_controller.dart';
import 'package:firebase_job_portal_poc/widgets/google_signin_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginView extends StatelessWidget {
  final LoginController loginController = Get.put(LoginController());

  LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF8E2DE2),
              Color(0xFF4A00E0),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Spacer(flex: 8),
              Center(child: Image.asset("assets/images/login_icon.png")),
              const Spacer(flex: 1),
              const Center(
                child: Text(
                  textAlign: TextAlign.center,
                  'Welcome to Job Portal',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      fontFamily: 'Poppins'),
                ),
              ), const Center(
                child: Text(
                  textAlign: TextAlign.center,
                  '  Start your journey to find and apply for a job in Top MNCs.',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey,
                      fontFamily: 'Poppins'),
                ),
              ),
              const Spacer(flex: 3),
              Center(
                child: GoogleSignInButton(loginController: loginController),
              ),
              const Spacer(flex: 4),
            ],
          ),
        ),
      ),
    );
  }
}
