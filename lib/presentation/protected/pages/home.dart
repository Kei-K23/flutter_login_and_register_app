import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_login_and_register_app/common/theme/bloc/theme_bloc.dart';
import 'package:flutter_login_and_register_app/common/theme/bloc/theme_event.dart';
import 'package:flutter_login_and_register_app/common/theme/bloc/theme_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeBloc = BlocProvider.of<ThemeBloc>(context);
    final emailController = TextEditingController(text: "user1@example.com");
    final usernameController = TextEditingController(text: "John Doe");
    final phoneController = TextEditingController(text: "+959 987321743");

    return Scaffold(
      appBar: AppBar(
        title: Text("Your Profile"),
        backgroundColor: themeBloc.state.brightness == Brightness.light
            ? Colors.white
            : Colors.black,
        actionsPadding: const EdgeInsets.symmetric(horizontal: 25),
        actions: [
          ElevatedButton(
            style: ButtonStyle(
              foregroundColor: WidgetStateProperty.all(
                themeBloc.state.appTheme.isLight
                    ? Colors.blue
                    : Colors.blue.shade200,
              ),
              backgroundColor: WidgetStateProperty.all(
                themeBloc.state.appTheme.isLight
                    ? Colors.blue.shade50
                    : Colors.blue.shade900,
              ),
            ),
            onPressed: () {
              final currentTheme = context.read<ThemeBloc>().state.appTheme;
              final newTheme = currentTheme == AppTheme.light
                  ? AppTheme.dark
                  : AppTheme.light;
              themeBloc.add(ThemeChanged(newTheme));
            },
            child: Icon(
              themeBloc.state.appTheme.isLight
                  ? Icons.dark_mode
                  : Icons.light_mode,
            ),
          ),
        ],
      ),
      backgroundColor: themeBloc.state.brightness == Brightness.light
          ? Colors.white
          : Colors.black,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 10),
              const Center(
                child: CircleAvatar(
                  radius: 60,
                  backgroundImage: NetworkImage(
                    "https://avatar.iran.liara.run/public",
                  ),
                  backgroundColor: Colors.lightBlue,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "John Doe",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 40),
              TextField(
                controller: usernameController,
                decoration: const InputDecoration(
                  hintText: "John Doe",
                  labelText: "Username",
                  border: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Colors.black),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1.5, color: Colors.black),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  hintText: "Enter your email address",
                  labelText: "Email Address",
                  border: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Colors.black),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1.5, color: Colors.black),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: phoneController,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  hintText: "Enter your phone number",
                  labelText: "Phone number",
                  border: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Colors.black),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1.5, color: Colors.black),
                  ),
                ),
              ),
              const SizedBox(height: 50),
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
                onPressed: () {},
                child: const Text('Save Profile'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
