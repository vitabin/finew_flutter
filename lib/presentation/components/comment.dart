import 'package:flutter/material.dart';
import '../../domain/entities/comment.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/feed.dart';

class CommentBuilder {
  late final double id;
  late final String content;
  late final String createdAt;
  late final String updatedAt;
  late final String userId;
  late final String userProfileImage;
  late final String nickName;

  final BuildContext context;

  CommentBuilder({
    required this.context,
  });

  CommentBuilder setComment(Comment comment) {
    id = comment.id;
    content = comment.content;
    createdAt = comment.createdAt;
    updatedAt = comment.updatedAt;
    userId = comment.userId;
    userProfileImage = comment.userProfileImage;
    nickName = comment.nickName;

    return this;
  }

  Widget _buildComment() {
    Size screenSize = MediaQuery.of(context).size;

    return Container(
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(color: Color(0x009395a0)),
          bottom: BorderSide(color: Color(0x009395a0)),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          avatar(imgUrl: userProfileImage),
          SizedBox(width: 10.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  DefaultTextStyle(
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                    child: Text(nickName),
                  ),
                  SizedBox(width: 5.w),
                  DefaultTextStyle(
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey,
                    ),
                    child: Text(createdAt),
                  ),
                ],
              ),
              SizedBox(height: 5.h),
              SizedBox(
                width: screenSize.width - 100,
                child: DefaultTextStyle(
                  style: TextStyle(
                    fontSize: 15.sp,
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
