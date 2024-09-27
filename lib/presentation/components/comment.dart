import 'dart:developer';

import 'package:flutter/material.dart';
import '../../core/utils/helpers.dart';
import '../../domain/entities/comment.dart';
import '../widgets/feed.dart';

class CommentBuilder {
  late final double id;
  late final String content;
  late final String createdAt;
  late final String updatedAt;
  late final String userId;
  late final String userProfileImage;
  late final String nickName;

  final Size screenSize;

  CommentBuilder({
    required this.screenSize,
  });

  void setComment(Comment comment) {
    id = comment.id;
    content = comment.content;
    createdAt = comment.createdAt;
    updatedAt = comment.updatedAt;
    userId = comment.userId;
    userProfileImage = comment.userProfileImage;
    nickName = comment.nickName;
  }

  Widget _buildComment() {
    return Container(
      width: screenSize.width,
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(color: Color(0x9395A0)),
          bottom: BorderSide(color: Color(0x9395A0)),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          avatar(userProfileImage),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const SizedBox(width: 10),
                  Utils.buildText(nickName),
                  const SizedBox(width: 5),
                  Utils.buildText(createdAt),
                ],
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  Utils.buildText(content),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget build() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: _buildComment(),
    );
  }
}
