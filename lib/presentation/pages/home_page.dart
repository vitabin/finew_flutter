import 'package:flutter/material.dart';
import '../../config/themes/app_theme.dart';
import 'community_page.dart';
import 'portfolio_page.dart';

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
      backgroundColor: const Color(0xFFFFFFFF),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildCategoryButton('커뮤니티', 0),
                    _buildCategoryButton('홈', 1),
                    _buildCategoryButton('포트폴리오', 2),
                  ],
                ),
              ),
              // 컨텐츠 영역
              Expanded(
                child: _buildContent(),
              ),
            ],
          )),
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
      child: Text(
        text,
        style: TextStyle(
          color: Colors.black,
          fontWeight:
              _currentIndex == index ? FontWeight.bold : FontWeight.normal,
          fontSize: Config.fontSize['title'],
        ),
      ),
    );
  }

  Widget _buildContent() {
    switch (_currentIndex) {
      case 0:
        return const CommunityPage();
      case 1:
        return _buildHomeContent();
      case 2:
        return const PortfolioPage();
      default:
        return _buildHomeContent();
    }
  }

  Widget _buildHomeContent() {
    return ListView(
      children: [
        // ETF 섹션
        Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('가장 많이 검색한 용어',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      color: Colors.blue,
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('ETF',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                          Text('상장지수펀드(Exchange Traded Fund)의 약자로...',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12)),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
        // 추천 도서 섹션
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('추천 도서',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      color: Colors.blue,
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('추천 도서',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                          Text('추천 도서 소개 및 설명...',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12)),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
        // 가장 많이본 뉴스 섹션
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('가장 많이본 뉴스',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      color: Colors.blue,
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('가장 많이본 뉴스',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                          Text('가장 많이본 뉴스 소개 및 설명...',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12)),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
        // 시황 분석 섹션
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('시황 분석',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      color: Colors.blue,
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('시황 분석',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                          Text('시황 분석 소개 및 설명...',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12)),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
