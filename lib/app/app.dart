import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../presentation/pages/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      designSize: MediaQuery.of(context).size, // 디자인 해상도
      minTextAdapt: true,
    );
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'S-Core_Dream_OTF',
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
