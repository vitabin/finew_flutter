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

  static Icon flag = Icon(
    Icons.flag_outlined,
    size: Config.iconSize,
  );

  static Icon checkBox = Icon(
    Icons.check_box_outline_blank,
    size: Config.iconSize,
  );

  static Icon checkedBox = Icon(
    Icons.check_box_outlined,
    size: Config.iconSize,
  );
}

class MeditationSvgAssets {
  static final MeditationSvgAssets _instance = MeditationSvgAssets._internal();

  factory MeditationSvgAssets() {
    return _instance;
  }

  MeditationSvgAssets._internal();

  Map<AssetName, String> assets = {
    AssetName.search: "assets/icons/search.svg",
    AssetName.vectorBottom: "assets/img/Vector.svg",
    AssetName.vectorTop: "assets/img/Vector-1.svg",
    AssetName.headphone: "assets/icons/headphone.svg",
    AssetName.tape: "assets/icons/tape.svg",
    AssetName.vectorSmallBottom: "assets/img/VectorSmallBottom.svg",
    AssetName.vectorSmallTop: "assets/img/VectorSmallTop.svg",
    AssetName.back: "assets/icons/back.svg",
    AssetName.heart: "assets/icons/heart.svg",
    AssetName.chart: "assets/icons/chart.svg",
    AssetName.discover: "assets/icons/discover.svg",
    AssetName.profile: "assets/icons/profile.svg",
    AssetName.menu: "assets/icons/menu.svg",
    AssetName.user: "assets/icons/user.svg",
    AssetName.home: "assets/icons/home.svg",
    AssetName.plus: "assets/icons/plus.svg",
    AssetName.bookmark: "assets/icons/bookmark.svg",
    AssetName.list: "assets/icons/list.svg",
    AssetName.moon: "assets/icons/moon.svg",
    AssetName.userXmark: "assets/icons/user-xmark.svg",
  };
}

enum AssetName {
  search,
  vectorBottom,
  vectorTop,
  headphone,
  tape,
  vectorSmallBottom,
  vectorSmallTop,
  back,
  heart,
  chart,
  discover,
  profile,
  menu,
  home,
  user,
  list,
  bookmark,
  plus,
  moon,
  userXmark,
}
