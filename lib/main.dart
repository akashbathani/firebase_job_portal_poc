import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_job_portal_poc/bindings/initial_binding.dart';
import 'package:firebase_job_portal_poc/firebase_options.dart';
import 'package:firebase_job_portal_poc/routes/app_routes.dart';
import 'package:firebase_job_portal_poc/services/shared_preferences_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesService.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  bool isLoggedIn = SharedPreferencesService.getBool('isLoggedIn') ?? false;

  runApp(MyApp(isLoggedIn: isLoggedIn));
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;

  const MyApp({super.key, required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Job Portal',
      initialRoute: AppRoutes.initialRoute(isLoggedIn),
      getPages: AppRoutes.routes(isLoggedIn),
      initialBinding: InitialBinding(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Poppins',
        textTheme: Theme.of(context).textTheme.apply(
          bodyColor: Colors.black,
          displayColor: Colors.black,
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}
