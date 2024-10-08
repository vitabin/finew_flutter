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

  Widget build() {
    if (title == null || context == null || category == null) {
      Exception();
    }

    return Container(
      height: 290,
      margin: const EdgeInsets.symmetric(
        vertical: 1,
        horizontal: 1,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            setHeader(),
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
            Expanded(
              child: SizedBox(
                child: Text(
                  context!,
                  softWrap: true, // 자동 줄바꿈 설정
                  overflow: TextOverflow.ellipsis, // 넘친 텍스트는 잘림
                  maxLines: 7,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            feedInteractionBar(),
          ],
        ),
      ),
    );
  }
}
