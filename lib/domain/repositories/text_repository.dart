class TextRepository {
  static final _instance = TextRepository._internal();

  factory TextRepository() {
    return _instance;
  }

  TextRepository._internal();

  Map<TextName, String> assets = {
    TextName.follow: '팔로우',
    TextName.following: '팔로잉',
    TextName.bookmark: '북마크',
    TextName.post: '개시글',
  };
}

enum TextName {
  follow,
  following,
  post,
  bookmark,
}
