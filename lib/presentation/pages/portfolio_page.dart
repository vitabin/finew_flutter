import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../widgets/performance_item_card.dart';

class PortfolioPage extends StatelessWidget {
  const PortfolioPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 4,
      itemBuilder: (context, index) {
        return _buildPortfolioItem();
      },
    );
  }

  Widget _buildPortfolioItem() {
    final data = AdPerformanceData(
      nickName: 'Name',
      postAt: 'Post At',
      isFollowing: false,
      performanceData: {
        '주식': 30,
        '부동산': 40,
        '예적금': 10,
        '펀드': 10,
      },
      totalReturn: 2257.8,
    );

    return PerformanceItemCard(
      nickName: data.nickName,
      postAt: data.postAt,
      isFollowing: data.isFollowing,
      performanceData: data.performanceData,
      totalReturn: data.totalReturn,
      chart: PieChart(
        PieChartData(
          sections: data.performanceData.entries.map((e) {
            return PieChartSectionData(
              color: _getColor(e.key),
              value: e.value.toDouble(),
              title: '${e.value}%',
              radius: 50,
              titleStyle: const TextStyle(color: Colors.white, fontSize: 12),
            );
          }).toList(),
        ),
      ),
    );
  }

  Color _getColor(String category) {
    switch (category) {
      case '주식':
        return Colors.red;
      case '부동산':
        return Colors.blue;
      case '예적금':
        return Colors.green;
      case '펀드':
        return Colors.orange;
      default:
        return Colors.grey;
    }
  }
}

class AdPerformanceData {
  final String nickName;
  final String postAt;
  final bool isFollowing;
  final Map<String, int> performanceData;
  final double totalReturn;

  AdPerformanceData({
    required this.nickName,
    required this.postAt,
    required this.isFollowing,
    required this.performanceData,
    required this.totalReturn,
  });
}
