// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import '../../config/themes/app_theme.dart';
import '../../core/utils/helpers.dart';
import '../../domain/entities/feed.dart';
import '../widgets/button.dart';
import '../widgets/feed.dart';
import '../../domain/entities/comment.dart';
import 'buttons.dart';

class FeedBuilder {
  late final Container content;
  late final double id;
  late final String nickName;
  late final String createdAt;
  late final String updatedAt;
  late final String userId;
  late final String userProfileImage;
  late final bool userFollowStatus;
  late final bool userLikeStatus;
  late final bool bookmarkStatus;
  late final List<Comment>? comments;

  late final String? title;
  late final String? context;
  late final String? category;

  void setFeed(Feed feed) {
    id = feed.id;
    createdAt = feed.createdAt;
    nickName = feed.nickName;
    userId = feed.userId;
    userProfileImage = feed.userProfileImage;
    userFollowStatus = feed.userFollowStatus;
    userLikeStatus = feed.userLikeStatus;
    bookmarkStatus = feed.bookmarkStatus;
  }

  void setPost(Post post) {
    title = post.title;
    context = post.context;
    category = post.category;
  }

  Widget setHeader() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        avatar(userProfileImage),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Utils.buildText(
              nickName,
              textSize: Config.fontSize['context'],
            ),
            Utils.buildText(
              createdAt,
              textColor: Colors.grey[600],
            ),
          ],
        ),
        const SizedBox(
          width: 10,
        ),
        const FollowButton(),
      ],
    );
  }

  void buildPost() {
    if (title == null || context == null || category == null) {
      Exception();
    }

    content = Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Utils.buildText(
            '[${category!}] ${title!}',
            textWeight: FontWeight.bold,
            textSize: Config.fontSize['title'],
          ),
          const SizedBox(height: 5),
          Utils.buildText(context!, textSize: Config.fontSize['context']),
        ],
      ),
    );
  }

  Widget build() {
    return Container(
      height: 300,
      margin: EdgeInsets.symmetric(
        vertical: Config.feedMargin['vertical']!,
        horizontal: Config.feedMargin['horizontal']!,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: setHeader(),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: content,
            ),
          ),
          feedInteractionBar(),
        ],
      ),
    );
  }
}
