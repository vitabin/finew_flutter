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
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  DefaultTextStyle(
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                    child: Text(nickName),
                  ),
                  const SizedBox(width: 5),
                  DefaultTextStyle(
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey,
                    ),
                    child: Text(createdAt),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              SizedBox(
                width: screenSize.width - 100,
                child: DefaultTextStyle(
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                  child: Text(
                    content,
                    softWrap: true, // 자동 줄바꿈 설정
                    overflow: TextOverflow.clip, // 넘친 텍스트는 잘림
                  ),
                ),
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
