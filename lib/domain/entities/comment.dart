class Comment {
  final double id;
  final String content;
  final String createdAt;
  final String updatedAt;
  final String userId;
  final String userProfileImage;
  final String nickName;

  Comment({
    required this.id,
    required this.content,
    required this.createdAt,
    required this.updatedAt,
    required this.userId,
    required this.userProfileImage,
    required this.nickName,
  });
}
