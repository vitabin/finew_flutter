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
    required double id,
    required String createdAt,
    required String updatedAt,
    required String userId,
    required String userProfileImage,
    required String nickName,
    List<Comment>? comments,
    required bool userFollowStatus,
    required bool userLikeStatus,
    required bool bookmarkStatus,
    required this.title,
    required this.context,
    required this.category,
  }) : super(
          id: id,
          createdAt: createdAt,
          updatedAt: updatedAt,
          userId: userId,
          userProfileImage: userProfileImage,
          nickName: nickName,
          comments: comments,
          userFollowStatus: userFollowStatus,
          userLikeStatus: userLikeStatus,
          bookmarkStatus: bookmarkStatus,
        );
}

class Portfolio extends Feed {
  late final String content;
  late final String userPostCount;
  late final String userCommentCount;
  late final String userLikeCount;

  Portfolio({
    required double id,
    required String createdAt,
    required String updatedAt,
    required String userId,
    required String userProfileImage,
    required String nickName,
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
          nickName: nickName,
          comments: comments,
          userFollowStatus: userFollowStatus,
          userLikeStatus: userLikeStatus,
          bookmarkStatus: bookmarkStatus,
        );
}
