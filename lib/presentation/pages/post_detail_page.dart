import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../domain/entities/comment.dart';
import '../../domain/entities/feed.dart';
import '../components/comment.dart';
import '../components/feed.dart';

String id = 'asdf';

class PostDetailPage extends StatefulWidget {
  final Post post;
  const PostDetailPage({super.key, required this.post});

  @override
  _PostDetailPageState createState() => _PostDetailPageState();
}

class _PostDetailPageState extends State<PostDetailPage> {
  Future<bool> _isMyPost(String userId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(id) ?? false;
  }

  // 댓글 입력을 위한 컨트롤러
  final TextEditingController _commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Widget post = FeedBuilder(buildContext: context, isDetail: true)
        .setFeed(widget.post)
        .setPost(widget.post)
        .build();
    List<Widget> comments = Comment.testComment
        .map(
          (comment) =>
              CommentBuilder(context: context).setComment(comment).build(),
        )
        .toList();

    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            post,
            ...comments,
            SizedBox(
              height: 55.h,
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        height: 55.h,
        padding: EdgeInsets.symmetric(horizontal: 25.0.w),
        child: Row(
          children: [
            Expanded(
              child: SizedBox(
                child: TextField(
                  controller: _commentController,
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w400,
                  ),
                  maxLines: null, // 최대 줄 수 설정
                  textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: '댓글을 남겨보세요.',
                    hintStyle: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  onTapOutside: (event) {
                    FocusManager.instance.primaryFocus?.unfocus();
                  },
                ),
              ),
            ),
            IconButton(
              icon: Icon(Icons.send),
              onPressed: () {
                // 댓글을 추가하는 로직
                String newComment = _commentController.text;
                // if (newComment.isNotEmpty) {
                //   // 댓글 리스트에 추가하고 화면 갱신
                //   setState(() {
                //     Comment.testComment.add(Comment(content: newComment));
                //   });
                //   _commentController.clear(); // 입력란 초기화
                // }
              },
            ),
          ],
        ),
      ),
    );
  }
}
