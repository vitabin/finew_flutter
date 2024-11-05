import 'dart:developer';

import 'package:flutter/material.dart';
import '../icons/icons.dart';
import '../widgets/button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FollowButton extends StatefulWidget {
  const FollowButton(
      {super.key, required this.height, required this.width, this.letterSpace});
  final double width;
  final double height;
  final double? letterSpace;

  @override
  FollowButtonState createState() => FollowButtonState();
}

class LikeButton extends StatefulWidget {
  const LikeButton({super.key});

  @override
  LikeButtonState createState() => LikeButtonState();
}

class BookmarkButton extends StatefulWidget {
  const BookmarkButton({super.key});

  @override
  BookmarkButtonState createState() => BookmarkButtonState();
}

class CommentButton extends StatefulWidget {
  const CommentButton({super.key});

  @override
  CommentButtonState createState() => CommentButtonState();
}

class ReportButtons extends StatefulWidget {
  const ReportButtons({Key? key}) : super(key: key);

  @override
  _ReportButtonsState createState() => _ReportButtonsState();
}

class _ReportButtonsState extends State<ReportButtons> {
  OverlayEntry? _overlayEntry;
  final double _overlayHeight = 0.7; // 초기 오버레이 높이 비율
  final double _overlayWidth = 0.5; // 초기 오버레이 폭 비율
  int? _currentIdx;
  final Map<String, int> _idxMap = {
    '광고': 0,
    '분쟁/혐오': 1,
    '욕설': 2,
    '선정성': 3,
    '스캠/사기': 4,
    '허위사실': 5,
  };

  Widget _buildItem(BuildContext context, String text, int idx) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _currentIdx = (_currentIdx == idx) ? null : idx; // 선택 해제 또는 선택
          _overlayEntry?.remove();
          _overlayEntry = _createOverlayEntry(context);
          Overlay.of(context).insert(_overlayEntry!);
        });
      },
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Theme.of(context).canvasColor,
        ),
        child: SizedBox(
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DefaultTextStyle(
                style: Theme.of(context).textTheme.bodyLarge!,
                child: Text(text),
              ),
              _currentIdx == idx
                  ? CustomIcons.checkedBox
                  : CustomIcons.checkBox,
            ],
          ),
        ),
      ),
    );
  }

  OverlayEntry _createOverlayEntry(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    List<Widget> itemList = _idxMap.entries
        .map((entry) => _buildItem(context, entry.key, entry.value))
        .toList();

    return OverlayEntry(
      builder: (context) => GestureDetector(
        onTap: () {
          // 외부 클릭 시 오버레이 닫기
          _overlayEntry?.remove();
          _overlayEntry = null;
          _currentIdx = null;
        },
        child: Stack(
          children: [
            // 배경 클릭으로 오버레이 닫기
            Positioned.fill(
              child: Container(color: Colors.black54), // 배경을 어둡게
            ),
            Positioned(
              top: screenSize.height * (1 - _overlayHeight),
              left: screenSize.width * 0.3,
              child: Material(
                borderRadius: BorderRadius.circular(10),
                child: SizedBox(
                  height: screenSize.height * 0.5,
                  width: screenSize.width * _overlayWidth,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: ThemeData.light().canvasColor,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(),
                    ),
                    child: Column(
                      children: [
                        DefaultTextStyle(
                          style: Theme.of(context).textTheme.titleLarge!,
                          child: const Text(
                            '신고 사유를\n선택해주세요.',
                            textAlign: TextAlign.center,
                          ),
                        ),
                        ...itemList,
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (_overlayEntry != null) {
          _overlayEntry?.remove();
          _overlayEntry = null;
          _currentIdx = null; // 오버레이가 닫힐 때 선택 해제
        } else {
          _overlayEntry = _createOverlayEntry(context);
          Overlay.of(context).insert(_overlayEntry!);
        }
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomIcons.flag,
          const SizedBox(width: 5),
          const Text(
            '신고하기',
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

class StatelessButton extends StatelessWidget {
  const StatelessButton({
    super.key,
    required this.page,
    required this.icon,
    this.height,
    this.width,
    this.title,
  });

  final Icon icon;
  final Widget page;
  final double? height;
  final double? width;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => page,
          ),
        );
      },
      child: SizedBox(
        height: height ?? 70,
        width: width ?? 70,
        child: Column(
          children: [
            DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color.fromARGB(255, 163, 207, 251),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 3,
                    blurRadius: 8,
                    offset: const Offset(1, 0),
                  ),
                ],
              ),
              child: icon,
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              title ?? '',
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
