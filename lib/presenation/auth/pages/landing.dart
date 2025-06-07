import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Landing extends StatelessWidget {
  const Landing({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
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
            const Center(
              child: const Text(
                "Welcome to the app",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Text(
                  "We're excited to help you register and login with smooth and secure way to enter our awesome app.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(Colors.black.toARGB32()).withValues(alpha: .5),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 100),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextButton(
                  style: TextButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50),
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    textStyle: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                    // textStyle: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {},
                  child: Text('Login'),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextButton(
                  style: TextButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50),
                    foregroundColor: Colors.blue,
                    textStyle: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                    // textStyle: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {},
                  child: const Text('Create an account'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
