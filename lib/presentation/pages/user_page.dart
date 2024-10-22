import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../domain/repositories/text_repository.dart';
import '../components/buttons.dart';
import '../components/custom_top_nav_bar_dash.dart';
import '../widgets/feed.dart';

class UserPage extends StatefulWidget {
  final String userId;

  const UserPage(this.userId, {super.key});

  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  final _pageController = PageController();
  int _pageIdx = 0;

  void _onPageChanged(int index) {
    setState(() {
      _pageIdx = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              avatar(size: 80),
              Padding(
                padding: EdgeInsets.only(left: 15.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.userId,
                      style: const TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    FollowButton(
                      height: 25.h,
                      width: 250.w,
                      letterSpace: 40.w,
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          CustomTopNavBarDash(
            onChange: (index) {
              _onPageChanged(index);
            },
            defaultSelectedIndex: _pageIdx,
            textName: const [
              TextName.post,
              TextName.bookmark,
            ],
          ),
        ],
      ),
    );
  }
}
