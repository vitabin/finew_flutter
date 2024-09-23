import 'package:flutter/material.dart';
import '../../domain/entities/feed.dart';
import 'button.dart';

Widget buildFeedItem({Feed? feed, Post? post}) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.1),
          spreadRadius: 1,
          blurRadius: 3,
          offset: const Offset(0, 1),
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CircleAvatar(
                radius: 20,
                backgroundColor: Colors.grey,
                child: Icon(Icons.person, color: Colors.white),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Nick Name',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Text('Post At',
                      style: TextStyle(color: Colors.grey[600], fontSize: 12)),
                  const SizedBox(height: 8),
                ],
              ),
              const SizedBox(width: 10),
              const FollowButton(),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Text(
            '[카테고리] 제목 - 최대길이 30자\n본문 - 최대 300자까지 미리보기\n초과시 더보기 버튼으로 해당 피드로 이동',
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        feedInteractionBar(),
      ],
    ),
  );
}

Widget feedInteractionBar() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(width: 40),
              actionButton(Icons.favorite_border, '좋아요'),
            ],
          ),
        ),
        const SizedBox(width: 20),
        actionButton(Icons.chat_bubble_outline, '댓글'),
        const SizedBox(width: 20),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              actionButton(Icons.bookmark_border, '북마크'),
              const SizedBox(width: 40),
            ],
          ),
        ),
      ],
    ),
  );
}
