import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../icons/icons.dart';
import '../widgets/svg_asset.dart';

class CustomBottomNavBarDash extends StatefulWidget {
  final int defaultSelectedIndex;
  final Function(int) onChange;
  final List<AssetName> svgName;
  final Color selectedColor;
  final Color unselectedColor;
  final double sizeIcon;

  const CustomBottomNavBarDash({
    super.key,
    this.defaultSelectedIndex = 0,
    required this.onChange,
    required this.svgName,
    this.selectedColor = Colors.green,
    this.unselectedColor = Colors.grey,
    this.sizeIcon = 30,
  });

  @override
  _CustomBottomNavBarDashState createState() => _CustomBottomNavBarDashState();
}

class _CustomBottomNavBarDashState extends State<CustomBottomNavBarDash> {
  int _selectedIndex = 0;
  List<AssetName> _svgName = [];

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.defaultSelectedIndex;
    _svgName = widget.svgName;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> navBarItemList = [];

    for (var i = 0; i < _svgName.length; i++) {
      navBarItemList.add(buildNavBarItem(_svgName[i], i));
    }

    return SizedBox(
      height: 70.h,
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: navBarItemList,
      ),
    );
  }

  Widget buildNavBarItem(AssetName svg, int index) {
    return GestureDetector(
      onTap: () {
        widget.onChange(index);
        _selectedIndex = index;
      },
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width / _svgName.length,
            padding: EdgeInsets.only(bottom: 5.h, top: 8.h),
            child: SvgPicture.asset(
              MeditationSvgAssets().assets[svg]!,
              color: _selectedIndex == index
                  ? widget.selectedColor
                  : widget.unselectedColor,
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
      width: 40,
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
      width: 40,
      height: 0,
      margin: EdgeInsets.only(top: 7.h),
      color: Colors.transparent,
    );
  }
}
