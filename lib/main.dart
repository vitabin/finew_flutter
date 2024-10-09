import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'app/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  bool isDarkMode = await getThemePreference(); // 저장된 테마를 가져옴
  runApp(MyApp(isDarkMode: isDarkMode));
}

Future<bool> getThemePreference() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getBool('isDarkMode') ?? false; // 저장된 값이 없으면 기본값 false
}
