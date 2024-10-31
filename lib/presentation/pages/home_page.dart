import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../app/app.dart';
import '../../domain/repositories/page_repository.dart';
import '../components/custom_bottom_nav_bar_dash.dart';
import '../components/home_category_grid.dart';
import '../components/top_keyword.dart';
import '../icons/icons.dart';
import '../components/svg_asset.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'community_page.dart';
import 'setting_page.dart';
import 'user_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageController = PageController();
  int _pageIdx = 0;

  Future<void> _refresh() async {
    await Future.delayed(const Duration(seconds: 2));
  }

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

  void _onPageChanged(int index) {
    setState(() {
      _pageIdx = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          scrolledUnderElevation: 0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                icon: const Icon(Icons.notifications_none),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: _refresh,
        child: PageView(
          controller: _pageController,
          onPageChanged: _onPageChanged,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            _buildHomeContent(context),
            const UserPage('vas'),
            const SettingPage(),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavBarDash(
        onChange: (index) {
          _pageIdx = index;
          _pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeIn,
          );
        },
        defaultSelectedIndex: _pageIdx,
        svgName: const [
          AssetName.home,
          AssetName.user,
          AssetName.menu,
        ],
      ),
    );
  }

  Widget _buildHomeContent(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.only(right: 15.w, left: 15.w, top: 10.h, bottom: 20.h),
          child: TextField(
            decoration: InputDecoration(
              hintText: '키워드또는 내용으로 검색',
              hintStyle: Theme.of(context).textTheme.bodyMedium,
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
        Expanded(
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "가장 많이 검색한 용어",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    const TopKeywordCard(),
                    SizedBox(height: 10.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 28.w),
                      child: GridView(
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 12.w,
                          mainAxisExtent: 125.w,
                          mainAxisSpacing: 15.w,
                        ),
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          HomeCategoryGrid(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PageRepository()
                                      .pages[PageName.community]!,
                                ),
                              );
                            },
                            title: "커뮤니티",
                            gradientStartColor: const Color(0xff13DEA0),
                            gradientEndColor: const Color(0xff06B782),
                          ),
                          HomeCategoryGrid(
                            onTap: () {},
                            title: "용어사전",
                            gradientStartColor: const Color(0xffFC67A7),
                            gradientEndColor: const Color(0xffF6815B),
                            icon: SvgAsset(
                              assetName: AssetName.tape,
                              height: 24.h,
                              width: 24.w,
                            ),
                          ),
                          HomeCategoryGrid(
                            onTap: () {},
                            title: "퀴즈",
                            icon: SvgAsset(
                              assetName: AssetName.tape,
                              height: 24.w,
                              width: 24.w,
                            ),
                          ),
                          HomeCategoryGrid(
                            onTap: () {},
                            title: "뉴스",
                            gradientStartColor: const Color(0xffFFD541),
                            gradientEndColor: const Color(0xffF0B31A),
                          ),
                          HomeCategoryGrid(
                            onTap: () {},
                            title: "시황분석",
                            icon: SvgAsset(
                              assetName: AssetName.tape,
                              height: 24.w,
                              width: 24.w,
                            ),
                          ),
                          HomeCategoryGrid(
                            onTap: () {},
                            title: "추천도서",
                            icon: SvgAsset(
                              assetName: AssetName.tape,
                              height: 24.w,
                              width: 24.w,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
