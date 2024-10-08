import 'package:flutter/material.dart';

import '../../data/models/books.dart';

class RecommendBook extends StatefulWidget {
  RecommendBook(this.data, {super.key});
  final BookData data;

  @override
  _RecommendBookState createState() => _RecommendBookState();
}

class _RecommendBookState extends State<RecommendBook> {
  Widget createItem() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          width: 70,
          height: 100,
          child: DecoratedBox(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/img/book.png'),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          widget.data.title,
          style: const TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w400,
          ),
        ),
        Text(
          '정가: ${widget.data.price.toString().split('.')[0]}₩',
          style: const TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double screenWidth = screenSize.width;

    return SizedBox(
      width: screenWidth,
      height: 150,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          createItem(),
          createItem(),
          createItem(),
        ],
      ),
    );
  }
}
