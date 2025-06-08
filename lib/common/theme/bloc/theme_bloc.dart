import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_login_and_register_app/common/theme/bloc/theme_event.dart';
import 'package:flutter_login_and_register_app/common/theme/bloc/theme_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(const ThemeState()) {
    on<ThemeChanged>(_onThemeChanged);
    on<LoadTheme>(_onLoadTheme);
    _startListeningToBrightness();
  }

  static const String _prefsThemeKey = "app_theme";

  void _startListeningToBrightness() {
    WidgetsBinding.instance.platformDispatcher.onPlatformBrightnessChanged =
        () {
          if (state.appTheme == AppTheme.system) {
            add(ThemeChanged(AppTheme.system));
          }
        };
  }

  Future<void> _onThemeChanged(
    ThemeChanged event,
    Emitter<ThemeState> emit,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_prefsThemeKey, event.appTheme.toString());

    final brightness = event.appTheme == AppTheme.system
        ? WidgetsBinding.instance.platformDispatcher.platformBrightness
        : event.appTheme == AppTheme.light
        ? Brightness.light
        : Brightness.dark;

    emit(state.copyWith(appTheme: event.appTheme, brightness: brightness));
  }

  Future<void> _onLoadTheme(LoadTheme event, Emitter<ThemeState> emit) async {
    final prefs = await SharedPreferences.getInstance();
    final themeString = prefs.get(_prefsThemeKey);
    AppTheme theme = AppTheme.system;

    if (themeString != null) {
      theme = AppTheme.values.firstWhere(
        (e) => e.toString() == themeString,
        orElse: () => AppTheme.system,
      );

      final brightness = theme == AppTheme.system
          ? WidgetsBinding.instance.platformDispatcher.platformBrightness
          : theme == AppTheme.light
          ? Brightness.light
          : Brightness.dark;

      emit(state.copyWith(appTheme: theme, brightness: brightness));
    }
  }
}
