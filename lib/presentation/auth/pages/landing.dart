import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_login_and_register_app/common/theme/bloc/theme_bloc.dart';
import 'package:flutter_login_and_register_app/presentation/auth/pages/login.dart';
import 'package:flutter_login_and_register_app/presentation/auth/pages/sign_up.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeBloc = BlocProvider.of<ThemeBloc>(context);

    return Scaffold(
      backgroundColor: themeBloc.state.appTheme.isLight
          ? Colors.white
          : Colors.black,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 100),
              Center(
                child: SvgPicture.asset(
                  "assets/images/landing_img.svg",
                  width: 350,
                  height: 350,
                  semanticsLabel: "Landing Image",
                ),
              ),
              Text(
                "Welcome to the app",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  "We're excited to help you register and login with smooth and secure way to enter our awesome app.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey,
                  ),
                ),
              ),
              const SizedBox(height: 100),
              TextButton(
                style: TextButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ),
                  );
                },
                child: Text('Login'),
              ),
              const SizedBox(height: 20),
              TextButton(
                style: TextButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  foregroundColor: Colors.blue,
                  textStyle: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SignUpScreen(),
                    ),
                  );
                },
                child: const Text('Create an account'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
