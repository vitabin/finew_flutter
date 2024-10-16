import 'package:flutter/material.dart';

import '../../domain/repositories/page_repository.dart';

class AppRoutes {
  static void routPage(BuildContext context, PageName pageName) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PageRepository().pages[pageName]!,
      ),
    );
  }
}
