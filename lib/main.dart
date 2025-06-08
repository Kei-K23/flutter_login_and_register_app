import 'package:flutter/material.dart';
import 'package:flutter_login_and_register_app/presentation/auth/pages/landing.dart';
import 'package:flutter_login_and_register_app/presentation/auth/pages/otp_verification.dart';
import 'package:flutter_login_and_register_app/presentation/auth/pages/reset_password.dart';
import 'package:flutter_login_and_register_app/presentation/protected/pages/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomeScreen(),
    );
  }
}
