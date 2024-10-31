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

  void _setNotificationState() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            const SetNotification(scopes: ['전체 허용', '전체 차단', '팔로워만 허용']),
      ),
    );
  }

  Widget _buildItem(Function onTap, Size screenSize, Widget child) {
    return InkWell(
      onTap: () => onTap(),
      borderRadius: BorderRadius.circular(10),
      child: SizedBox(
        width: screenSize.width,
        height: 40.h,
        child: child,
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
          SizedBox(height: 10.h),
          Row(
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
                    '다크 모드',
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
          _buildItem(
            _setNotificationState,
            screenSize,
            Row(
              children: [
                Icon(Icons.notifications_none, size: 30.sp),
                SizedBox(
                  width: 5.w,
                ),
                Text(
                  '알림 설정',
                  style: TextStyle(
                    fontSize: 20.sp,
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

class SetNotification extends StatefulWidget {
  const SetNotification({super.key, required this.scopes});
  final List<String> scopes;

  @override
  _SetNotificationState createState() => _SetNotificationState();
}

class _SetNotificationState extends State<SetNotification> {
  int currentIdx = 0;

  void _setScope(idx) {
    setState(() {
      currentIdx = idx;
      // TODO 서버로 알림 설정 보내기
    });
  }

  Widget _buildItem(String scope, int idx, BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return InkWell(
      onTap: () => _setScope(idx),
      child: Container(
        width: screenSize.width,
        height: 45.h,
        padding: EdgeInsets.all(10.sp),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              scope,
              style: TextStyle(
                fontSize: 20.sp,
              ),
            ),
            currentIdx == idx ? const Icon(Icons.check) : const Icon(null),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> items = [];
    for (var i = 0; i < widget.scopes.length; i++) {
      items.add(_buildItem(widget.scopes[i], i, context));
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('알림 설정'),
      ),
      body: Column(
        children: items,
      ),
    );
  }
}
