import 'package:flutter/material.dart';
import '../../config/themes/app_theme.dart';
import '../../core/utils/helpers.dart';
import '../components/home_category_grid.dart';
import '../components/top_keyword.dart';
import '../icons/icons.dart';
import '../widgets/svg_asset.dart';
import '../widgets/button.dart';
import 'community_page.dart';
import 'dictionary_page.dart';
import 'portfolio_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'test_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 1; // 0: 커뮤니티, 1: 홈, 2: 포트폴리오

  Future<void> _refresh() async {
    await Future.delayed(const Duration(seconds: 2));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1C2031),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          scrolledUnderElevation: 0,
          backgroundColor: Color(0xff1C2031),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                icon: const Icon(
                  Icons.notifications_none,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DiscoverPage(),
                    ),
                  );
                },
              ),
              IconButton(
                icon: const Icon(
                  Icons.menu,
                  color: Colors.white,
                ),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: _refresh,
        child: Column(
          children: [
            // 검색 바
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
              child: TextField(
                decoration: InputDecoration(
                  hintText: '키워드또는 내용으로 검색',
                  hintStyle: const TextStyle(
                    color: Colors.white,
                  ),
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            // 컨텐츠 영역
            Expanded(
              child: _buildContent(context),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xff1C2031),
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: '홈'),
          BottomNavigationBarItem(
              icon: Icon(Icons.book_outlined), label: '추천도서'),
          BottomNavigationBarItem(
              icon: Icon(Icons.article_outlined), label: '뉴스'),
          BottomNavigationBarItem(
              icon: Icon(Icons.edit_outlined), label: '시황분석'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline), label: 'My Page'),
        ],
      ),
    );
  }

  Widget _buildCategoryButton(String text, int index) {
    return TextButton(
      onPressed: () {
        setState(() {
          _currentIndex = index;
        });
      },
      child: Utils.buildText(
        text,
        textWeight:
            _currentIndex == index ? FontWeight.bold : FontWeight.normal,
        textColor: _currentIndex == index ? Colors.black : Colors.grey,
        textSize: Config.fontSize['title'],
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    switch (_currentIndex) {
      case 0:
        return const CommunityPage();
      case 1:
        return _buildHomeContent(context);
      case 2:
        return const PortfolioPage();
      default:
        return _buildHomeContent(context);
    }
  }

  Widget _buildHomeContent(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "가장 많이 검색한 용어",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white70,
                    ),
                  ),
                  moreButton(context, const DictionaryPage()),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              //let's build our caroussel
              const TopKeywordCard(),
              SizedBox(
                height: 10.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 28.w),
                child: GridView(
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 19.w,
                    mainAxisExtent: 125.w,
                    mainAxisSpacing: 19.w,
                  ),
                  // shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    HomeCategoryGrid(
                      onTap: () {},
                      title: "Calming Sounds",
                      gradientStartColor: const Color(0xff13DEA0),
                      gradientEndColor: const Color(0xff06B782),
                    ),
                    HomeCategoryGrid(
                      onTap: () {},
                      title: "Insomnia",
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
                      title: "For Children",
                      gradientStartColor: const Color(0xffFFD541),
                      gradientEndColor: const Color(0xffF0B31A),
                    ),
                    HomeCategoryGrid(
                      onTap: () {},
                      title: "Tips For Sleeping",
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
    );
  }
}
