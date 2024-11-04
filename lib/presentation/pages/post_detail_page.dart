import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/entities/comment.dart';
import '../../domain/entities/feed.dart';
import '../components/comment.dart';
import '../components/feed.dart';

String id = 'asdf';

List<Comment> comment = [
  Comment(
    id: 1,
    content:
        'fksldjflasjfdoasjflasfndlsfjdslofjdsafjasdfasdfasdfasdfasdfsdafsadzxcvcxzfsdafsadvxczvasffsafksldjflasjfdoasjflasfndlsfjdslofjdsafjasdfasdfasdfasdfasdfsdafsadzxcvcxzfsdafsadvxczvasffsafksldjflasjfdoasjflasfndlsfjdslofjdsafjasdfasdfasdfasdfasdfsdafsadzxcvcxzfsdafsadvxczvasffsafksldjflasjfdoasjflasfndlsfjdslofjdsafjasdfasdfasdfasdfasdfsdafsadzxcvcxzfsdafsadvxczvasffsafksldjflasjfdoasjflasfndlsfjdslofjdsafjasdfasdfasdfasdfasdfsdafsadzxcvcxzfsdafsadvxczvasffsafksldjflasjfdoasjflasfndlsfjdslofjdsafjasdfasdfasdfasdfasdfsdafsadzxcvcxzfsdafsadvxczvasffsafksldjflasjfdoasjflasfndlsfjdslofjdsafjasdfasdfasdfasdfasdfsdafsadzxcvcxzfsdafsadvxczvasffsafksldjflasjfdoasjflasfndlsfjdslofjdsafjasdfasdfasdfasdfasdfsdafsadzxcvcxzfsdafsadvxczvasffsafksldjflasjfdoasjflasfndlsfjdslofjdsafjasdfasdfasdfasdfasdfsdafsadzxcvcxzfsdafsadvxczvasffsafksldjflasjfdoasjflasfndlsfjdslofjdsafjasdfasdfasdfasdfasdfsdafsadzxcvcxzfsdafsadvxczvasffsafksldjflasjfdoasjflasfndlsfjdslofjdsafjasdfasdfasdfasdfasdfsdafsadzxcvcxzfsdafsadvxczvasffsafksldjflasjfdoasjflasfndlsfjdslofjdsafjasdfasdfasdfasdfasdfsdafsadzxcvcxzfsdafsadvxczvasffsafksldjflasjfdoasjflasfndlsfjdslofjdsafjasdfasdfasdfasdfasdfsdafsadzxcvcxzfsdafsadvxczvasffsafksldjflasjfdoasjflasfndlsfjdslofjdsafjasdfasdfasdfasdfasdfsdafsadzxcvcxzfsdafsadvxczvasffsafksldjflasjfdoasjflasfndlsfjdslofjdsafjasdfasdfasdfasdfasdfsdafsadzxcvcxzfsdafsadvxczvasffsa',
    createdAt: '2024-09-11',
    updatedAt: '2024-09-09',
    userId: '1',
    userProfileImage: '',
    nickName: 'vitabin',
  ),
  Comment(
    id: 2,
    content: 'fksldjflasjfdoasjflasfndlsfjdslofjdsafjasdf',
    createdAt: '2024-09-12',
    updatedAt: '2024-09-09',
    userId: 'x',
    userProfileImage: '',
    nickName: 'vitabin',
  ),
  Comment(
    id: 1,
    content: 'fksldjflasjfdoasjflasfndlsfjdslofjdsafjasdf',
    createdAt: '2024-09-11',
    updatedAt: '2024-09-09',
    userId: '1',
    userProfileImage: '',
    nickName: 'vitabin',
  ),
  Comment(
    id: 2,
    content: 'fksldjflasjfdoasjflasfndlsfjdslofjdsafjasdf',
    createdAt: '2024-09-12',
    updatedAt: '2024-09-09',
    userId: 'x',
    userProfileImage: '',
    nickName: 'vitabin',
  ),
  Comment(
    id: 1,
    content: 'fksldjflasjfdoasjflasfndlsfjdslofjdsafjasdf',
    createdAt: '2024-09-11',
    updatedAt: '2024-09-09',
    userId: '1',
    userProfileImage: '',
    nickName: 'vitabin',
  ),
  Comment(
    id: 2,
    content: 'fksldjflasjfdoasjflasfndlsfjdslofjdsafjasdf',
    createdAt: '2024-09-12',
    updatedAt: '2024-09-09',
    userId: 'x',
    userProfileImage: '',
    nickName: 'vitabin',
  ),
  Comment(
    id: 1,
    content: 'fksldjflasjfdoasjflasfndlsfjdslofjdsafjasdf',
    createdAt: '2024-09-11',
    updatedAt: '2024-09-09',
    userId: '1',
    userProfileImage: '',
    nickName: 'vitabin',
  ),
  Comment(
    id: 2,
    content: 'fksldjflasjfdoasjflasfndlsfjdslofjdsafjasdf',
    createdAt: '2024-09-12',
    updatedAt: '2024-09-09',
    userId: 'x',
    userProfileImage: '',
    nickName: 'vitabin',
  ),
  Comment(
    id: 1,
    content: 'fksldjflasjfdoasjflasfndlsfjdslofjdsafjasdf',
    createdAt: '2024-09-11',
    updatedAt: '2024-09-09',
    userId: '1',
    userProfileImage: '',
    nickName: 'vitabin',
  ),
  Comment(
    id: 2,
    content: 'fksldjflasjfdoasjflasfndlsfjdslofjdsafjasdf',
    createdAt: '2024-09-12',
    updatedAt: '2024-09-09',
    userId: 'x',
    userProfileImage: '',
    nickName: 'vitabin',
  ),
  Comment(
    id: 1,
    content: 'fksldjflasjfdoasjflasfndlsfjdslofjdsafjasdf',
    createdAt: '2024-09-11',
    updatedAt: '2024-09-09',
    userId: '1',
    userProfileImage: '',
    nickName: 'vitabin',
  ),
  Comment(
    id: 2,
    content: 'fksldjflasjfdoasjflasfndlsfjdslofjdsafjasdf',
    createdAt: '2024-09-12',
    updatedAt: '2024-09-09',
    userId: 'x',
    userProfileImage: '',
    nickName: 'vitabin',
  ),
  Comment(
    id: 1,
    content: 'fksldjflasjfdoasjflasfndlsfjdslofjdsafjasdf',
    createdAt: '2024-09-11',
    updatedAt: '2024-09-09',
    userId: '1',
    userProfileImage: '',
    nickName: 'vitabin',
  ),
  Comment(
    id: 2,
    content: 'fksldjflasjfdoasjflasfndlsfjdslofjdsafjasdf',
    createdAt: '2024-09-12',
    updatedAt: '2024-09-09',
    userId: 'x',
    userProfileImage: '',
    nickName: 'vitabin',
  ),
  Comment(
    id: 1,
    content: 'fksldjflasjfdoasjflasfndlsfjdslofjdsafjasdf',
    createdAt: '2024-09-11',
    updatedAt: '2024-09-09',
    userId: '1',
    userProfileImage: '',
    nickName: 'vitabin',
  ),
  Comment(
    id: 2,
    content: 'fksldjflasjfdoasjflasfndlsfjdslofjdsafjasdf',
    createdAt: '2024-09-12',
    updatedAt: '2024-09-09',
    userId: 'x',
    userProfileImage: '',
    nickName: 'vitabin',
  ),
  Comment(
    id: 1,
    content: 'fksldjflasjfdoasjflasfndlsfjdslofjdsafjasdf',
    createdAt: '2024-09-11',
    updatedAt: '2024-09-09',
    userId: '1',
    userProfileImage: '',
    nickName: 'vitabin',
  ),
  Comment(
    id: 2,
    content: 'fksldjflasjfdoasjflasfndlsfjdslofjdsafjasdf',
    createdAt: '2024-09-12',
    updatedAt: '2024-09-09',
    userId: 'x',
    userProfileImage: '',
    nickName: 'vitabin',
  ),
  Comment(
    id: 1,
    content: 'fksldjflasjfdoasjflasfndlsfjdslofjdsafjasdf',
    createdAt: '2024-09-11',
    updatedAt: '2024-09-09',
    userId: '1',
    userProfileImage: '',
    nickName: 'vitabin',
  ),
  Comment(
    id: 2,
    content: 'fksldjflasjfdoasjflasfndlsfjdslofjdsafjasdf',
    createdAt: '2024-09-12',
    updatedAt: '2024-09-09',
    userId: 'x',
    userProfileImage: '',
    nickName: 'vitabin',
  ),
  Comment(
    id: 1,
    content: 'fksldjflasjfdoasjflasfndlsfjdslofjdsafjasdf',
    createdAt: '2024-09-11',
    updatedAt: '2024-09-09',
    userId: '1',
    userProfileImage: '',
    nickName: 'vitabin',
  ),
  Comment(
    id: 2,
    content: 'fksldjflasjfdoasjflasfndlsfjdslofjdsafjasdf',
    createdAt: '2024-09-12',
    updatedAt: '2024-09-09',
    userId: 'x',
    userProfileImage: '',
    nickName: 'vitabin',
  ),
  Comment(
    id: 1,
    content: 'fksldjflasjfdoasjflasfndlsfjdslofjdsafjasdf',
    createdAt: '2024-09-11',
    updatedAt: '2024-09-09',
    userId: '1',
    userProfileImage: '',
    nickName: 'vitabin',
  ),
  Comment(
    id: 2,
    content: 'fksldjflasjfdoasjflasfndlsfjdslofjdsafjasdf',
    createdAt: '2024-09-12',
    updatedAt: '2024-09-09',
    userId: 'x',
    userProfileImage: '',
    nickName: 'vitabin',
  ),
  Comment(
    id: 1,
    content: 'fksldjflasjfdoasjflasfndlsfjdslofjdsafjasdf',
    createdAt: '2024-09-11',
    updatedAt: '2024-09-09',
    userId: '1',
    userProfileImage: '',
    nickName: 'vitabin',
  ),
  Comment(
    id: 2,
    content: 'fksldjflasjfdoasjflasfndlsfjdslofjdsafjasdf',
    createdAt: '2024-09-12',
    updatedAt: '2024-09-09',
    userId: 'x',
    userProfileImage: '',
    nickName: 'vitabin',
  ),
  Comment(
    id: 1,
    content: 'fksldjflasjfdoasjflasfndlsfjdslofjdsafjasdf',
    createdAt: '2024-09-11',
    updatedAt: '2024-09-09',
    userId: '1',
    userProfileImage: '',
    nickName: 'vitabin',
  ),
  Comment(
    id: 2,
    content: 'fksldjflasjfdoasjflasfndlsfjdslofjdsafjasdf',
    createdAt: '2024-09-12',
    updatedAt: '2024-09-09',
    userId: 'x',
    userProfileImage: '',
    nickName: 'vitabin',
  ),
  Comment(
    id: 1,
    content: 'fksldjflasjfdoasjflasfndlsfjdslofjdsafjasdf',
    createdAt: '2024-09-11',
    updatedAt: '2024-09-09',
    userId: '1',
    userProfileImage: '',
    nickName: 'vitabin',
  ),
  Comment(
    id: 2,
    content: 'fksldjflasjfdoasjflasfndlsfjdslofjdsafjasdf',
    createdAt: '2024-09-12',
    updatedAt: '2024-09-09',
    userId: 'x',
    userProfileImage: '',
    nickName: 'vitabin',
  ),
];

class PostDetailPage extends StatefulWidget {
  final Post post;
  const PostDetailPage({super.key, required this.post});

  @override
  _PostDetailPageState createState() => _PostDetailPageState();
}

class _PostDetailPageState extends State<PostDetailPage> {
  Future<bool> _isMyPost() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(id) ?? false;
  }

  @override
  Widget build(BuildContext context) {
    Widget post = FeedBuilder(buildContext: context, isDetail: true)
        .setFeed(widget.post)
        .setPost(widget.post)
        .build();
    List<Widget> comments = comment
        .map(
          (comment) =>
              CommentBuilder(context: context).setComment(comment).build(),
        )
        .toList();

    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            post,
            ...comments,
          ],
        ),
      ),
    );
  }
}
