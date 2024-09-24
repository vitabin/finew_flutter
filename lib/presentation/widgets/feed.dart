import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../config/themes/app_theme.dart';

Widget avatar(String? imgUrl) {
  if (imgUrl != null) {
    return Container(
      width: Config.thumnailSize['width'],
      height: Config.thumnailSize['height'],
      decoration:
          const BoxDecoration(color: Colors.grey, shape: BoxShape.circle),
      child: const Icon(
        Icons.person,
        color: Colors.white,
      ),
    );
  }

  return Container(
      width: Config.thumnailSize['width'],
      height: Config.thumnailSize['height'],
      decoration: const BoxDecoration(shape: BoxShape.circle),
      child: CachedNetworkImage(imageUrl: imgUrl!));
}
