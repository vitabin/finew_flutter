import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../app/app.dart';
import '../icons/icons.dart';
import '../widgets/feed.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  void _deleteAccount() {}

  void _toggleTheme() async {
    setState(() {
      MyApp.themeNotifier.value = MyApp.themeNotifier.value == ThemeMode.light
          ? ThemeMode.dark
          : ThemeMode.light;
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(
      'isDarkMode',
      MyApp.themeNotifier.value == ThemeMode.dark,
    );
  }

  Widget _buildItem(Function onTap, Size screenSize, Widget child) {
    return InkWell(
      onTap: () => onTap(),
      borderRadius: BorderRadius.circular(10),
      child: SizedBox(
        width: screenSize.width,
        height: 40,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 10.w,
            vertical: 5.h,
          ),
          child: child,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              avatar(
                size: 70.sp,
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'nickName',
                    style: TextStyle(
                      fontSize: 25.sp,
                    ),
                  ),
                  Text(
                    'userId',
                    style: TextStyle(
                      fontSize: 15.sp,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      MeditationSvgAssets().assets[AssetName.moon]!,
                      color: MyApp.themeNotifier.value == ThemeMode.light
                          ? Colors.black
                          : Colors.yellow,
                      width: 30.w,
                      height: 30.h,
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Text(
                      '다크모드',
                      style: TextStyle(
                        fontSize: 20.sp,
                      ),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    _toggleTheme();
                  },
                  child: Icon(
                    MyApp.themeNotifier.value == ThemeMode.light
                        ? Icons.toggle_off_outlined
                        : Icons.toggle_on_outlined,
                    size: 40.sp,
                  ),
                ),
              ],
            ),
          ),
          _buildItem(
            _deleteAccount,
            screenSize,
            Row(
              children: [
                SvgPicture.asset(
                  MeditationSvgAssets().assets[AssetName.userXmark]!,
                  color: Colors.red,
                  width: 30.w,
                  height: 30.h,
                ),
                SizedBox(
                  width: 5.w,
                ),
                Text(
                  '회원탈퇴',
                  style: TextStyle(
                    fontSize: 20.sp,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
