import 'package:flutter/material.dart';
import '../widgets/button.dart';

class FollowButton extends StatefulWidget {
  const FollowButton({super.key, required this.height, required this.width, this.letterSpace});
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
