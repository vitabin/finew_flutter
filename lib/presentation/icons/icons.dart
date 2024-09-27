import 'package:flutter/material.dart';
import '../../config/themes/app_theme.dart';

class CustomIcons {
  static Icon liked = Icon(
    Icons.favorite,
    size: Config.iconSize,
    color: Colors.red,
  );

  static Icon unLiked = Icon(
    Icons.favorite_border,
    size: Config.iconSize,
  );

  static Icon comment = Icon(
    Icons.chat_bubble_outline,
    size: Config.iconSize,
  );

  static Icon unBookmarked = Icon(
    Icons.bookmark_border,
    size: Config.iconSize,
  );

  static Icon bookmarked = Icon(
    Icons.bookmark,
    size: Config.iconSize,
    color: Colors.yellow,
  );
}
