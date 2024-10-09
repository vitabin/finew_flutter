import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../presentation/pages/home_page.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key, required this.isDarkMode});
  final bool isDarkMode;

  static final ValueNotifier<ThemeMode> themeNotifier =
      ValueNotifier(ThemeMode.light);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    MyApp.themeNotifier.value =
        widget.isDarkMode ? ThemeMode.dark : ThemeMode.light;
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      designSize: MediaQuery.of(context).size, // 디자인 해상도
      minTextAdapt: true,
    );

    return ValueListenableBuilder(
      valueListenable: MyApp.themeNotifier,
      builder: (context, value, child) {
        return MaterialApp(
          title: 'Finew',
          theme: ThemeData(
            fontFamily: 'S-Core_Dream_OTF',
            primarySwatch: Colors.blue,
            brightness: Brightness.light,
            textTheme: const TextTheme(
              bodyLarge: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w400,
              ),
              bodyMedium: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
              bodySmall: TextStyle(
                color: Colors.black,
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
              titleLarge: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
              titleMedium: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.w700,
              ),
              titleSmall: TextStyle(
                color: Colors.black,
                fontSize: 12,
                fontWeight: FontWeight.w700,
              ),
              displayLarge: TextStyle(
                color: Colors.black87,
                fontSize: 20,
                fontWeight: FontWeight.w400,
              ),
              displayMedium: TextStyle(
                color: Colors.black87,
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
              displaySmall: TextStyle(
                color: Colors.black87,
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
            iconTheme: const IconThemeData(
              color: Colors.black87,
            ),
            disabledColor: Colors.grey,
          ),
          darkTheme: ThemeData(
            fontFamily: 'S-Core_Dream_OTF',
            primarySwatch: Colors.blue,
            brightness: Brightness.dark,
            textTheme: const TextTheme(
              bodyLarge: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w400,
              ),
              bodyMedium: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
              bodySmall: TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
              titleLarge: TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w700,
              ),
              titleMedium: TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w700,
              ),
              titleSmall: TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w700,
              ),
              displayLarge: TextStyle(
                color: Colors.white70,
                fontSize: 20,
                fontWeight: FontWeight.w400,
              ),
              displayMedium: TextStyle(
                color: Colors.white70,
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
              displaySmall: TextStyle(
                color: Colors.white70,
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
            iconTheme: const IconThemeData(
              color: Colors.white70,
            ),
            disabledColor: Colors.grey,
          ),
          themeMode: value,
          home: const HomePage(),
        );
      },
    );
  }
}
