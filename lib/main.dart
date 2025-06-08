import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_login_and_register_app/common/theme/bloc/theme_bloc.dart';
import 'package:flutter_login_and_register_app/common/theme/bloc/theme_event.dart';
import 'package:flutter_login_and_register_app/common/theme/bloc/theme_state.dart';
import 'package:flutter_login_and_register_app/presentation/protected/pages/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    BlocProvider(
      create: (context) => ThemeBloc()..add(LoadTheme()),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: state.brightness == Brightness.light ? lightTheme : darkTheme,
          home: HomeScreen(),
        );
      },
    );
  }
}
