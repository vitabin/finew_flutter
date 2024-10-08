import 'comment.dart';

class Feed {
  late final double id;
  late final String createdAt;
  late final String updatedAt;
  late final String userId;
  late final String userProfileImage;
  late final String nickName;
  late final List<Comment>? comments;
  late final bool userFollowStatus;
  late final bool userLikeStatus;
  late final bool bookmarkStatus;

  Feed({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.userId,
    required this.userProfileImage,
    required this.nickName,
    this.comments,
    required this.userFollowStatus,
    required this.userLikeStatus,
    required this.bookmarkStatus,
  });
}

class Post extends Feed {
  late final String title;
  late final String context;
  late final String category;

  Post({
    required super.id,
    required super.createdAt,
    required super.updatedAt,
    required super.userId,
    required super.userProfileImage,
    required super.nickName,
    super.comments,
    required super.userFollowStatus,
    required super.userLikeStatus,
    required super.bookmarkStatus,
    required this.title,
    required this.context,
    required this.category,
  });
}

class Portfolio extends Feed {
  late final String content;
  late final String userPostCount;
  late final String userCommentCount;
  late final String userLikeCount;

  Portfolio({
    required super.id,
    required super.createdAt,
    required super.updatedAt,
    required super.userId,
    required super.userProfileImage,
    required super.nickName,
    super.comments,
    required super.userFollowStatus,
    required super.userLikeStatus,
    required super.bookmarkStatus,
    required this.content,
    required this.userPostCount,
    required this.userCommentCount,
    required this.userLikeCount,
  });
}
