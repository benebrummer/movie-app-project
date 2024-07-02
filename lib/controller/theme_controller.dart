import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app_project/theme.dart';

class ThemeController extends GetxController{

  late String _theme = 'Light';
  ThemeData _currentTheme = AppTheme.lightTheme;

  String get theme => _theme;
  ThemeData get currentTheme => _currentTheme;


  void updateTheme() {
  if(currentTheme == AppTheme.lightTheme) {
    _currentTheme = AppTheme.darkTheme;
    _theme = 'Light';
    Get.changeThemeMode(ThemeMode.dark);
  }else {
    _currentTheme = AppTheme.lightTheme;
    _theme = 'Dark';
    Get.changeThemeMode(ThemeMode.light);
  }
  debugPrint(theme);
  update();
  }
}

enum ThemeCategory {
  light,
  dark,
}