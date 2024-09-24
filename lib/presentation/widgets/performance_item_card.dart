import 'package:flutter/material.dart';

import '../components/button.dart';

class PerformanceItemCard extends StatelessWidget {
  final String nickName;
  final String postAt;
  final bool isFollowing;
  final Map<String, int> performanceData;
  final double totalReturn;
  final Widget chart;

  const PerformanceItemCard({
    Key? key,
    required this.nickName,
    required this.postAt,
    required this.isFollowing,
    required this.performanceData,
    required this.totalReturn,
    required this.chart,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
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
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            const SizedBox(height: 16),
            SizedBox(height: 150, child: chart),
            const SizedBox(height: 16),
            Text('총 수익률 $totalReturn%',
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            const SizedBox(height: 16),
            buildActionButtons(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
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
          ],
        ),
        const SizedBox(width: 10),
        const FollowButton(),
      ],
    );
  }

  Widget buildActionButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        buildActionButton(Icons.favorite_border, '좋아요'),
        buildActionButton(Icons.chat_bubble_outline, '댓글'),
        buildActionButton(Icons.bookmark_border, '북마크'),
      ],
    );
  }

  Widget buildActionButton(IconData icon, String label) {
    return Row(
      children: [
        Icon(icon, size: 18),
        const SizedBox(width: 4),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}
