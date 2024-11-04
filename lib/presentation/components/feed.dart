// ignore_for_file: avoid_unnecessary_containers

import 'dart:developer';

import 'package:flutter/material.dart';
import '../../core/utils/helpers.dart';
import '../../domain/entities/feed.dart';
import '../widgets/button.dart';
import '../widgets/feed.dart';
import 'buttons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FeedBuilder {
  final BuildContext buildContext;
  late double id;
  late String nickName;
  late String createdAt;
  late String updatedAt;
  late String userId;
  late String userProfileImage;
  late bool userFollowStatus;
  late bool userLikeStatus;
  late bool bookmarkStatus;

  late String? title;
  late String? context;
  late String? category;

  late bool isDetail;

  FeedBuilder({required this.buildContext, this.isDetail = false});

  FeedBuilder setFeed(Feed feed) {
    id = feed.id;
    createdAt = feed.createdAt;
    nickName = feed.nickName;
    userId = feed.userId;
    userProfileImage = feed.userProfileImage;
    userFollowStatus = feed.userFollowStatus;
    userLikeStatus = feed.userLikeStatus;
    bookmarkStatus = feed.bookmarkStatus;
    return this;
  }

  FeedBuilder setPost(Post post) {
    title = post.title;
    context = post.context;
    category = post.category;
    return this;
  }

  Widget _setHeader() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        avatar(imgUrl: userProfileImage),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              nickName,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
            Utils.buildText(
              createdAt.replaceAll('-', '.'),
              textColor: Colors.grey[600],
            ),
          ],
        ),
        const SizedBox(
          width: 10,
        ),
        FollowButton(
          height: 20.h,
          width: 36.w,
        ),
      ],
    );
  }

  Widget build() {
    if (title == null || context == null || category == null) {
      throw Exception("Title, context, and category must not be null");
    }

    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 1,
        horizontal: 1,
      ),
      decoration: BoxDecoration(
        color: Theme.of(buildContext).cardTheme.color,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _setHeader(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Text(
                '[${category!}] ${title!}',
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
            ),
            Container(
              child: Text(
                context!,
                softWrap: true,
                overflow: isDetail ? TextOverflow.clip : TextOverflow.ellipsis,
                maxLines: isDetail ? null : 4,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: feedInteractionBar(isDetail),
            ),
          ],
        ),
      ),
    );
  }
}
