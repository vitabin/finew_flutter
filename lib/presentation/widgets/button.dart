import 'package:flutter/material.dart';

Widget feedInteractionBar() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        actionButton(Icons.favorite_border, '좋아요', 20, 12),
        actionButton(Icons.chat_bubble_outline, '댓글', 20, 12),
        actionButton(Icons.bookmark_border, '북마크', 20, 12),
      ],
    ),
  );
}

Widget actionButton(
  IconData icon,
  String label,
  double iconSize,
  double fontSize,
) {
  return Row(
    children: [
      Icon(icon, size: iconSize),
      const SizedBox(width: 4),
      Text(label, style: TextStyle(fontSize: fontSize)),
    ],
  );
}
