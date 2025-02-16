import 'package:bookly_app/Features/Splash/Presentation/View/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

void main() {
  runApp(const BooklyApp());
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData().copyWith(
        scaffoldBackgroundColor: const Color(0xff100B20),
      ),
      home: const SplashScreen(),
    );
  }
}
