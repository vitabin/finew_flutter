import 'package:flutter/material.dart';

import '../../domain/entities/comment.dart';
import '../components/comment.dart';

class CommentPage extends StatefulWidget {
  const CommentPage({super.key});

  @override
  _CommentPageState createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 5),
        itemCount: Comment.testComment.length,
        itemBuilder: (context, index) {
          CommentBuilder commentBuilder = CommentBuilder(
            context: context,
          );
          commentBuilder.setComment(Comment.testComment[index]);
          return commentBuilder.build();
        },
      ),
    );
  }
}
