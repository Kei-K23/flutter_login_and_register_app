import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_login_and_register_app/common/theme/bloc/theme_bloc.dart';
import 'package:flutter_login_and_register_app/common/ui/otp_pin_field.dart';

class OtpVerificationScreen extends StatelessWidget {
  const OtpVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeBloc = BlocProvider.of<ThemeBloc>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeBloc.state.appTheme.isLight
            ? Colors.white
            : Colors.black,
      ),
      backgroundColor: themeBloc.state.appTheme.isLight
          ? Colors.white
          : Colors.black,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              const Text(
                "OTP Verification",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                "Enter the OTP code we just send to your email to confirm your verification.",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 40),
              OtpPinField(
                onCompleted: (otpCode) {
                  print(otpCode);
                },
              ),
              const SizedBox(height: 50),
              const Center(
                child: const Text(
                  "Resend OTP in 0s",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Center(
                child: TextButton(
                  style: ButtonStyle(
                    foregroundColor: WidgetStateProperty.all(Colors.blue),
                    overlayColor: WidgetStateProperty.all(Colors.transparent),
                    padding: WidgetStateProperty.all(EdgeInsets.zero),
                    minimumSize: WidgetStateProperty.all(Size.zero),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    visualDensity: VisualDensity.compact,
                    textStyle: WidgetStateProperty.all(TextStyle(fontSize: 18)),
                  ),
                  onPressed: () {
                    print('Resend OTP');
                  },
                  child: Text(
                    'Resend OTP',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
