import 'package:flutter/material.dart';
import '../../domain/entities/comment.dart';
import '../../domain/entities/feed.dart';
import '../components/feed.dart';

Post dummyPost = Post(
  id: 1,
  createdAt: '2024-09-11',
  updatedAt: '2024-09-09',
  userId: '1',
  userProfileImage: 'https://picsum.photos/250?image=1',
  nickName: 'vitabin',
  comments: <Comment>[], // 빈 리스트를 명시적으로 변환
  userFollowStatus: false,
  userLikeStatus: false,
  bookmarkStatus: false,
  title: '이거 이렇게하는거 맞나요',
  context: '가나다라마바사',
  category: '질문',
);

class CommunityPage extends StatelessWidget {
  const CommunityPage({super.key});

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

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert'; // JSON 파싱을 위한 패키지
// import '../../domain/entities/feed.dart';
// // import '../../domain/entities/comment.dart';
// import '../widgets/feed.dart';

// class CommunityPage extends StatefulWidget {
//   const CommunityPage({super.key});

//   @override
//   _CommunityPageState createState() => _CommunityPageState();
// }

// class _CommunityPageState extends State<CommunityPage> {
//   late Future<List<Post>> futurePosts;

//   @override
//   void initState() {
//     super.initState();
//     futurePosts = fetchPosts(); // API에서 데이터를 받아옴
//   }

//   // API에서 데이터를 받아오는 함수
//   Future<List<Post>> fetchPosts() async {
//     final response = await http.get(Uri.parse('https://api.example.com/posts')); // 실제 API 경로

//     if (response.statusCode == 200) {
//       // JSON 데이터를 List<Post>로 변환
//       List jsonResponse = json.decode(response.body);
//       return jsonResponse.map((data) => Post.fromJson(data)).toList();
//     } else {
//       throw Exception('Failed to load posts');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<List<Post>>(
//       future: futurePosts,
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return const Center(child: CircularProgressIndicator());
//         } else if (snapshot.hasError) {
//           return Center(child: Text('Error: ${snapshot.error}'));
//         } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//           return const Center(child: Text('No posts available'));
//         } else {
//           return ListView.builder(
//             itemCount: snapshot.data!.length,
//             itemBuilder: (context, index) {
//               return _buildFeedItem(snapshot.data![index]);
//             },
//           );
//         }
//       },
//     );
//   }

//   // 여러 Post 객체를 받아서 화면에 출력
//   Widget _buildFeedItem(Post post) {
//     return buildFeedItem(post: post);
//   }
// }
