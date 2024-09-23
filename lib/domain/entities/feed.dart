import 'comment.dart';

abstract class Feed {
  final String id;
  final String createdAt;
  final String updatedAt;
  final String userId;
  final String userProfileImage;
  final String userNickName;
  final List<Comment>? comments;
  final bool userFollowStatus;
  final bool userLikeStatus;
  final bool bookmarkStatus;

  Feed({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.userId,
    required this.userProfileImage,
    required this.userNickName,
    this.comments,
    required this.userFollowStatus,
    required this.userLikeStatus,
    required this.bookmarkStatus,
  });
}

class Post extends Feed {
  final String title;
  final String content;
  final String category;

  Post({
    required String id,
    required String createdAt,
    required String updatedAt,
    required String userId,
    required String userProfileImage,
    required String userNickName,
    List<Comment>? comments,
    required bool userFollowStatus,
    required bool userLikeStatus,
    required bool bookmarkStatus,
    required this.title,
    required this.content,
    required this.category,
  }) : super(
          id: id,
          createdAt: createdAt,
          updatedAt: updatedAt,
          userId: userId,
          userProfileImage: userProfileImage,
          userNickName: userNickName,
          comments: comments,
          userFollowStatus: userFollowStatus,
          userLikeStatus: userLikeStatus,
          bookmarkStatus: bookmarkStatus,
        );

  // JSON 데이터를 Post 객체로 변환하는 팩토리 메서드
  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      userId: json['userId'],
      userProfileImage: json['userProfileImage'],
      userNickName: json['userNickName'],
      comments: [], // 실제로 comments를 어떻게 처리할지는 API 설계에 따름
      userFollowStatus: json['userFollowStatus'],
      userLikeStatus: json['userLikeStatus'],
      bookmarkStatus: json['bookmarkStatus'],
      title: json['title'],
      content: json['content'],
      category: json['category'],
    );
  }
}


class Portfolio extends Feed {
  final String content;
  final String userPostCount;
  final String userCommentCount;
  final String userLikeCount;

  Portfolio({
    required String id,
    required String createdAt,
    required String updatedAt,
    required String userId,
    required String userProfileImage,
    required String userNickName,
    List<Comment>? comments,
    required bool userFollowStatus,
    required bool userLikeStatus,
    required bool bookmarkStatus,
    required this.content,
    required this.userPostCount,
    required this.userCommentCount,
    required this.userLikeCount,
  }) : super(
          id: id,
          createdAt: createdAt,
          updatedAt: updatedAt,
          userId: userId,
          userProfileImage: userProfileImage,
          userNickName: userNickName,
          comments: comments,
          userFollowStatus: userFollowStatus,
          userLikeStatus: userLikeStatus,
          bookmarkStatus: bookmarkStatus,
        );
}
