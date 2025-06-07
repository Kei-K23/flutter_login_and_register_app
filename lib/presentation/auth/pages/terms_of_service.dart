import 'package:flutter/material.dart';

class TermsOfServiceScreen extends StatelessWidget {
  const TermsOfServiceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Terms of Service'),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              SizedBox(height: 16),
              Text(
                '1. Introduction\n\n'
                'By using this app, you agree to these Terms of Service. '
                'Please read them carefully.\n',
              ),
              SizedBox(height: 12),
              Text(
                '2. Use of the App\n\n'
                'You agree to use the app only for lawful purposes and '
                'in accordance with all applicable laws and regulations.\n',
              ),
              SizedBox(height: 12),
              Text(
                '3. Privacy\n\n'
                'We respect your privacy. Please refer to our Privacy Policy '
                'to understand how we handle your information.\n',
              ),
              SizedBox(height: 12),
              Text(
                '4. Changes\n\n'
                'We may update these terms at any time. Continued use of the app '
                'means you accept the new terms.\n',
              ),
              SizedBox(height: 12),
              Text(
                '5. Contact\n\n'
                'If you have any questions about these terms, contact us at support@example.com.',
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
