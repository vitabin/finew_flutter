import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../domain/entities/Top_keyword.dart';

// ignore: must_be_immutable
class TopKeywordCard extends StatefulWidget {
  const TopKeywordCard({super.key});
  @override
  State<TopKeywordCard> createState() => _TopKeywordCardState();
}

class _TopKeywordCardState extends State<TopKeywordCard> {
  int _topKeywordIdx = 0;

  Widget _createItem(TopKeywordData data) {
    return Material(
      borderRadius: BorderRadius.circular(30),
      child: InkWell(
        borderRadius: BorderRadius.circular(30),
        onTap: () {
          // TODO
        },
        child: Ink(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            image: DecorationImage(
              fit: BoxFit.fill,
              // image: NetworkImage(widget.data.imgUrl), TODO
              image: AssetImage(data.imgUrl),
            ),
          ),
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.0),
              gradient: const LinearGradient(
                colors: [Colors.transparent, Color.fromARGB(255, 38, 36, 36)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(
                left: 16.w,
                right: 16.w,
                top: 60.h,
                bottom: 5.h,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data.word,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  SizedBox(
                    height: 60.h,
                    child: Text(
                      data.explain,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w400,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Row(
                    children: [
                      ...data.tags.map(
                        (e) {
                          return Text(
                            '#$e ',
                            style: TextStyle(
                              color: Colors.white54,
                              fontSize: 15.sp,
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
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          itemCount: TopKeywordData.testData.length,
          itemBuilder: (context, index, id) =>
              _createItem(TopKeywordData.testData[index]),
          options: CarouselOptions(
            enableInfiniteScroll: false,
            enlargeCenterPage: true,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 5),
            initialPage: _topKeywordIdx,
            onPageChanged: (index, reason) {
              setState(() {
                _topKeywordIdx = index;
              });
            },
            // clipBehavior: Clip.antiAliasWithSaveLayer
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 30.h,
            ),
            AnimatedSmoothIndicator(
              activeIndex: _topKeywordIdx,
              count: TopKeywordData.testData.length,
              effect: ExpandingDotsEffect(
                dotWidth: 8,
                dotHeight: 8,
                dotColor: Theme.of(context).disabledColor,
                activeDotColor: Colors.blue,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
