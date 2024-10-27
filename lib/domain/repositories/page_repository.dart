import 'package:flutter/material.dart';

import '../../presentation/pages/comment_page.dart';
import '../../presentation/pages/community_page.dart';
import '../../presentation/pages/dictionary_page.dart';
import '../../presentation/pages/home_page.dart';
import '../../presentation/pages/portfolio_page.dart';
import '../../presentation/pages/setting_page.dart';
import '../../presentation/pages/user_page.dart';

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
    PageName.user: const UserPage('asdf'),
    PageName.setting: const SettingPage(),
  };
}

enum PageName {
  home,
  dictionary,
  comment,
  community,
  portfolio,
  user,
  setting,
}
