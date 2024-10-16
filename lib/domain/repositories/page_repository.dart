import 'package:flutter/material.dart';

import '../../presentation/pages/comment_page.dart';
import '../../presentation/pages/community_page.dart';
import '../../presentation/pages/dictionary_page.dart';
import '../../presentation/pages/home_page.dart';
import '../../presentation/pages/portfolio_page.dart';

class PageRepository {
  static final PageRepository _instance = PageRepository._internal();

  factory PageRepository() {
    return _instance;
  }

  PageRepository._internal();

  Map<PageName, Widget> pages = {
    PageName.home: const HomePage(),
    PageName.comment: const CommentPage(),
    PageName.dictionary: const DictionaryPage(),
    PageName.community: const CommunityPage(),
    PageName.portfolio: const PortfolioPage(),
  };
}

enum PageName {
  home,
  dictionary,
  comment,
  community,
  portfolio,
}
