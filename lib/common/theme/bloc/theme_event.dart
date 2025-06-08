import 'package:flutter_login_and_register_app/common/theme/bloc/theme_state.dart';

abstract class ThemeEvent {}

class ThemeChanged extends ThemeEvent {
  final AppTheme appTheme;

  ThemeChanged(this.appTheme);
}

class LoadTheme extends ThemeEvent {}
