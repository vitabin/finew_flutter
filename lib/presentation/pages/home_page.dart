import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../config/themes/app_theme.dart';
import '../../core/utils/helpers.dart';
import '../../data/models/Top_keyword.dart';
import '../components/top_keyword.dart';
import '../controllers/home_controller.dart';
import 'community_page.dart';
import 'dictionary_page.dart';
import 'portfolio_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 1; // 0: 커뮤니티, 1: 홈, 2: 포트폴리오
  int _pageIdx = 0;

  Future<void> _refresh() async {
    await Future.delayed(const Duration(seconds: 2));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
              icon: const Icon(Icons.notifications_none, color: Colors.black),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.menu, color: Colors.black),
              onPressed: () {},
            ),
          ],
        ),
      ),
      body: RefreshIndicator(
        onRefresh: _refresh,
        child: Column(
          children: [
            // 검색 바
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: '키워드로는 내용 검색',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ),
            // 카테고리 섹션
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildCategoryButton('커뮤니티', 0),
                      _buildCategoryButton('홈', 1),
                      _buildCategoryButton('포트폴리오', 2),
                    ],
                  ),
                  const DecoratedBox(
                    decoration: BoxDecoration(color: Colors.black),
                  ),
                ],
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
        backgroundColor: const Color(0xFFFFFFFF),
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
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
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
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DictionaryPage(),
                      ),
                    );
                  },
                  child: const Row(
                    children: [
                      Text(
                        '더보기',
                        style: TextStyle(fontSize: 15, color: Colors.black),
                      ),
                      Icon(
                        Icons.arrow_circle_right_outlined,
                        color: Colors.black,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            //let's build our caroussel
            CarouselSlider.builder(
              itemCount: TopKeywordData.testData.length,
              itemBuilder: (context, index, id) =>
                  TopKeywordCard(TopKeywordData.testData[index]),
              options: CarouselOptions(
                height: 200,
                enableInfiniteScroll: false,
                enlargeCenterPage: true,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 5),
                initialPage: _pageIdx,
                onPageChanged: (index, reason) {
                  setState(() {
                    _pageIdx = index;
                  });
                },
                // clipBehavior: Clip.antiAliasWithSaveLayer
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 30,
                ),
                AnimatedSmoothIndicator(
                  activeIndex: _pageIdx,
                  count: TopKeywordData.testData.length,
                  effect: const ExpandingDotsEffect(
                    dotWidth: 10,
                    dotHeight: 10,
                    activeDotColor: Colors.blue,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
