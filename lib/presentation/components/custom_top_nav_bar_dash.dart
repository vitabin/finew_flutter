import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../domain/repositories/text_repository.dart';
import '../icons/icons.dart';
import 'svg_asset.dart';

class CustomTopNavBarDash extends StatefulWidget {
  final int defaultSelectedIndex;
  final Function(int) onChange;
  final List<TextName> textName;
  final Color selectedColor;
  final Color unselectedColor;

  const CustomTopNavBarDash({
    super.key,
    this.defaultSelectedIndex = 0,
    required this.onChange,
    required this.textName,
    this.selectedColor = Colors.green,
    this.unselectedColor = Colors.grey,
  });

  @override
  _CustomTopNavBarDashState createState() => _CustomTopNavBarDashState();
}

class _CustomTopNavBarDashState extends State<CustomTopNavBarDash> {
  int _selectedIndex = 0;
  List<TextName> _textName = [];

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.defaultSelectedIndex;
    _textName = widget.textName;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> navBarItemList = [];

    for (var i = 0; i < _textName.length; i++) {
      navBarItemList.add(buildNavBarItem(_textName[i], i));
    }

    return SizedBox(
      height: 70.h,
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: navBarItemList,
      ),
    );
  }

  Widget buildNavBarItem(TextName text, int index) {
    return GestureDetector(
      onTap: () {
        widget.onChange(index);
        _selectedIndex = index;
      },
      child: Column(
        children: [
          Container(
            width: (MediaQuery.of(context).size.width / _textName.length) - 20,
            padding: EdgeInsets.only(bottom: 5.h, top: 8.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  TextRepository().assets[text]!,
                  style: TextStyle(
                    color: _selectedIndex == index
                        ? widget.selectedColor
                        : widget.unselectedColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 20.sp,
                  ),
                ),
              ],
            ),
          ),
          _selectedIndex == index ? selectedIndicator() : unselectedIndicator(),
        ],
      ),
    );
  }

  Widget selectedIndicator() {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      width: 60.w,
      height: 3,
      decoration: BoxDecoration(
        color: widget.selectedColor,
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }

  Widget unselectedIndicator() {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 100),
      width: 60.w,
      height: 0,
      margin: EdgeInsets.only(top: 7.h),
      color: Colors.transparent,
    );
  }
}
