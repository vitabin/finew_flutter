import 'package:flutter/material.dart';
import '../../domain/entities/comment.dart';
import '../../domain/entities/feed.dart';
import '../components/feed.dart';

Post dummyPost = Post(
  id: 1,
  createdAt: '2024-09-11',
  updatedAt: '2024-09-09',
  userId: '1',
  userProfileImage: '',
  nickName: 'vitabin',
  comments: <Comment>[], // 빈 리스트를 명시적으로 변환
  userFollowStatus: false,
  userLikeStatus: false,
  bookmarkStatus: false,
  title: '이거 이렇게하는거 맞나요',
  context: '가나다라마바사',
  category: '질문',
);

class CommunityPage extends StatefulWidget {
  const CommunityPage({super.key});

  @override
  _CommunityPageState createState() => _CommunityPageState();
}

class _CommunityPageState extends State<CommunityPage> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 4,
      itemBuilder: (context, index) {
        return _buildFeedItem();
      },
    );
  }

  Widget _buildFeedItem() {
    FeedBuilder builder = FeedBuilder();
    builder.setFeed(dummyPost);
    builder.setPost(dummyPost);
    builder.buildPost();

    return builder.build();
  }
}
