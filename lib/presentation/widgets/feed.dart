import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

Widget avatar(String imgUrl) {
  if (imgUrl == '') {
    return const DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.grey,
        shape: BoxShape.circle,
      ),
      child: Icon(
        size: 40,
        Icons.person,
        color: Colors.white,
      ),
    );
  }

  return DecoratedBox(
    decoration: const BoxDecoration(shape: BoxShape.circle),
    child: CachedNetworkImage(
      imageUrl: imgUrl,
      width: 40,
      height: 40,
    ),
  );
}
