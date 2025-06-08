import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

enum AppTheme {
  light,
  dark,
  system;

  bool get isLight => this == AppTheme.light;
  bool get isDark => this == AppTheme.dark;
  bool get isSystem => this == AppTheme.system;
}

class ThemeState extends Equatable {
  final AppTheme appTheme;
  final Brightness brightness;

  const ThemeState({
    this.appTheme = AppTheme.system,
    this.brightness = Brightness.light,
  });

  @override
  List<Object?> get props => [appTheme];

  ThemeState copyWith({AppTheme? appTheme, Brightness? brightness}) {
    return ThemeState(
      appTheme: appTheme ?? AppTheme.system,
      brightness: brightness ?? Brightness.light,
    );
  }
}

final ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  primarySwatch: Colors.blue,
);

final ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,
  primarySwatch: Colors.blueGrey,
);
