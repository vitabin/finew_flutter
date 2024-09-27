import 'package:flutter/material.dart';
import '../../domain/entities/comment.dart';
import '../components/comment.dart';
import '../icons/icons.dart';
import '../../core/utils/helpers.dart';
import '../components/buttons.dart';
import '../pages/comment_page.dart';

Widget feedInteractionBar() {
  return const Padding(
    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        LikeButton(),
        CommentButton(),
        BookmarkButton(),
      ],
    ),
  );
}

Widget actionButton(
  IconData icon,
  String label, {
  double? iconSize,
  double? fontSize,
}) {
  return Row(
    children: [
      Icon(icon, size: iconSize),
      const SizedBox(width: 5),
      Utils.buildText(label),
    ],
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
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (_isFollowing)
              const Icon(Icons.check, color: Colors.white, size: 16),
            if (_isFollowing) const SizedBox(width: 2),
            Text(
              _isFollowing ? '팔로잉' : '팔로우',
              style: const TextStyle(color: Colors.white, fontSize: 12),
            ),
          ],
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
            Utils.buildText('좋아요', textSize: 15),
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
            Utils.buildText('북마크', textSize: 15),
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

  // 오버레이 항목을 생성하는 함수
  OverlayEntry _createOverlayEntry(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double screenWidth = screenSize.width;
    double screenHeight = screenSize.height;

    return OverlayEntry(
      builder: (context) => Positioned(
        top: screenHeight * (1 - overlayHeight), // 오버레이의 위치
        child: GestureDetector(
          onVerticalDragUpdate: (details) {
            setState(() {
              overlayHeight -= details.delta.dy; // 드래그에 따른 높이 조정
              if (dragOffset > 100) {
                overlayEntry?.remove();
                overlayEntry = null;
                dragOffset = 0.0; // 드래그 초기화
              } else {
                setState(() {
                  // 임계점에 도달하지 않았을 경우 초기화
                  dragOffset = 0.0;
                });
              }
            });
          },
          child: Material(
            color: Colors.transparent,
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
                      height: 4.5,
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
      ),
    );
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
          Overlay.of(context)?.insert(overlayEntry!);
        }
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomIcons.comment,
          const SizedBox(width: 5),
          Utils.buildText('댓글', textSize: 15),
        ],
      ),
    );
  }
}
