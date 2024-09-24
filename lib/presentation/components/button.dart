import 'package:flutter/material.dart';

class FollowButton extends StatefulWidget {
  const FollowButton({super.key});

  @override
  _FollowButtonState createState() => _FollowButtonState();
}

class _FollowButtonState extends State<FollowButton> {
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
