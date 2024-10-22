import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

Widget avatar({String? imgUrl, double? size}) {
  if (imgUrl == null || imgUrl == '') {
    return DecoratedBox(
      decoration: const BoxDecoration(
        color: Colors.grey,
        shape: BoxShape.circle,
      ),
      child: Icon(
        size: size ?? 40,
        Icons.person,
        color: Colors.white,
      ),
    );
  }

  return DecoratedBox(
    decoration: const BoxDecoration(shape: BoxShape.circle),
    child: CachedNetworkImage(
      imageUrl: imgUrl,
      width: size ?? 40,
      height: size ?? 40,
    ),
  );
}
