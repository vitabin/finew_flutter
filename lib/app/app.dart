import 'package:flutter/material.dart';
import '../presentation/pages/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
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
