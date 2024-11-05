import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../config/themes/app_theme.dart';
import '../icons/icons.dart';
import '../../core/utils/helpers.dart';
import '../components/buttons.dart';
import '../pages/comment_page.dart';

Widget feedInteractionBar(bool isDetail) {
  if (isDetail) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        LikeButton(),
        BookmarkButton(),
        ReportButtons(),
      ],
    );
  } else {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        LikeButton(),
        CommentButton(),
        BookmarkButton(),
      ],
    );
  }
}

Widget moreButton(BuildContext context, Widget page) {
  return TextButton(
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => page,
        ),
      );
    },
    child: Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Text(
            '더보기',
            style: Theme.of(context).textTheme.displayMedium,
          ),
        ),
        Icon(
          Icons.arrow_circle_right_outlined,
          color: Theme.of(context).iconTheme.color,
        ),
      ],
    ),
  );
}

class FollowButtonState extends State<FollowButton> {
  bool _isFollowing = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isFollowing = !_isFollowing;
        });
        // TODO: 실제 팔로우 로직 구현
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          color: _isFollowing ? Colors.grey[800] : Colors.blue,
          borderRadius: BorderRadius.circular(8),
        ),
        child: SizedBox(
          width: widget.width,
          height: widget.height,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (_isFollowing)
                const Icon(Icons.check, color: Colors.white, size: 16),
              if (_isFollowing) const SizedBox(width: 2),
              Text(
                _isFollowing ? '팔로잉' : '팔로우',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12.sp,
                  letterSpacing: widget.letterSpace ?? 0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LikeButtonState extends State<LikeButton> {
  bool _isLiked = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isLiked = !_isLiked;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(microseconds: 300),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _isLiked ? CustomIcons.liked : CustomIcons.unLiked,
            const SizedBox(width: 5),
            const Text(
              '좋아요',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BookmarkButtonState extends State<BookmarkButton> {
  bool _isBooked = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isBooked = !_isBooked;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(microseconds: 300),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _isBooked ? CustomIcons.bookmarked : CustomIcons.unBookmarked,
            const SizedBox(width: 5),
            const Text(
              '북마크',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CommentButtonState extends State<CommentButton> {
  OverlayEntry? overlayEntry;
  double overlayHeight = 0.7; // 초기 오버레이 높이 비율
  double dragOffset = 0.0; // 드래그 이동 거리
  double maxOffset = 300.0;
  final TextEditingController _commentController =
      TextEditingController(); // 텍스트 컨트롤러 추가
  final FocusNode _focusNode = FocusNode();

  // 오버레이 항목을 생성하는 함수
  OverlayEntry _createOverlayEntry(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double screenWidth = screenSize.width;
    double screenHeight = screenSize.height;

    return OverlayEntry(
      builder: (context) => Stack(
        children: [
          Container(
            color: Colors.transparent, // 투명한 배경
            width: screenWidth,
            height: screenHeight,
          ),
          Positioned(
            top: screenHeight * (1 - overlayHeight) +
                dragOffset, // 드래그 오프셋을 고려하여 위치 업데이트
            child: GestureDetector(
              onVerticalDragEnd: (details) {
                dragOffset = 0.0; // 드래그 초기화
                overlayHeight = 0.7;
                overlayEntry?.markNeedsBuild();
              },
              onVerticalDragUpdate: (details) {
                if (details.delta.dy > 0) {
                  dragOffset += details.delta.dy; // 드래그에 따른 높이 조정
                }
                if (dragOffset > maxOffset) {
                  overlayEntry?.remove();
                  overlayEntry = null;
                  dragOffset = 0.0; // 드래그 초기화
                  overlayHeight = 0.7;
                  _commentController.clear(); // 입력 필드 초기화
                }
                overlayEntry?.markNeedsBuild(); // 오버레이를 다시 그리도록 요청
              },
              child: Container(
                width: screenWidth,
                height: screenHeight * overlayHeight,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Container(
                        width: screenWidth * 0.3,
                        height: 5,
                        decoration: const BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      ),
                    ),
                    const CommentPage(),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            child: Material(
              child: Container(
                width: screenWidth,
                height: 70,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 30,
                  ),
                  child: TextField(
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: Config.fontSize['comment']!,
                    ),
                    maxLines: 10,
                    keyboardType: TextInputType.multiline,
                    controller: _commentController, // 텍스트 컨트롤러 설정
                    focusNode: _focusNode, // 포커스 노드 설정
                    // TextField 사용
                    decoration: const InputDecoration(
                      hintText: '댓글을 입력하세요.', // 입력 힌트
                      border: InputBorder.none, // 테두리 없음
                    ),
                    onTap: () {
                      FocusManager.instance.primaryFocus?.requestFocus();
                    },
                    onTapOutside: (event) {
                      FocusManager.instance.primaryFocus?.unfocus();
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _commentController.dispose(); // 컨트롤러 해제
    _focusNode.dispose(); // 포커스 노드 해제
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (overlayEntry != null) {
          overlayEntry?.remove();
          overlayEntry = null;
        } else {
          overlayEntry = _createOverlayEntry(context);
          Overlay.of(context).insert(overlayEntry!);
        }
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomIcons.comment,
          const SizedBox(width: 5),
          const Text(
            '댓글',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
