import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../data/models/Top_keyword.dart';

// ignore: must_be_immutable
class TopKeywordCard extends StatefulWidget {
  TopKeywordCard(this.data, {super.key});
  TopKeywordData data;
  @override
  State<TopKeywordCard> createState() => _TopKeywordCardState();
}

class _TopKeywordCardState extends State<TopKeywordCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: () {
        // TODO
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          image: DecorationImage(
            fit: BoxFit.fill,
            // image: NetworkImage(widget.data.imgUrl),
            image: AssetImage(widget.data.imgUrl),
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.0),
            gradient: const LinearGradient(
              colors: [Colors.transparent, Colors.black],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.data.word,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 5.0,
              ),
              SizedBox(
                height: 60,
                child: Text(
                  widget.data.explain,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                  overflow: TextOverflow.fade,
                ),
              ),
              const SizedBox(
                height: 5.0,
              ),
              Row(
                children: [
                  ...widget.data.tags.map(
                    (e) {
                      return Text(
                        '#$e ',
                        style: const TextStyle(
                          color: Colors.white54,
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
