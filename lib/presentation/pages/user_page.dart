import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../domain/entities/comment.dart';
import '../../domain/entities/feed.dart';
import '../../domain/repositories/text_repository.dart';
import '../components/buttons.dart';
import '../components/custom_top_nav_bar_dash.dart';
import '../components/feed.dart';
import '../widgets/feed.dart';

Post dummyPost = Post(
  id: 1,
  createdAt: '2024-09-11',
  updatedAt: '2024-09-09',
  userId: '1',
  userProfileImage: '',
  nickName: 'vitabin',
  userFollowStatus: false,
  userLikeStatus: false,
  bookmarkStatus: false,
  title: '이거 이렇게하는거 맞나요',
  context:
      '가나다라마바사asdffasdfxzcvcxzvasfasdfcvzcxvadfhadgfasfvxcb cnsfgsadfvsdbsdgasdfvs adfasdf savcnxz,mvnfddsjoipafmavsfpjospifjqwlnfxcz;vaopfidnfmsnvapdighso[fndfmqnwdfidshjvzoxjvlfasnfdsapfhdslkfj sdakljfjsadopfjsd]ncxvm,xnpofasojfwdmfnwdpofnvkmczxnvpoafguyhwquoirwefknmfgvbipadfghfpowdjrfqwklfnas;kjvxzchopcvsdjafdlmvn  xzcklvzxcgbcvipasdhfjlkasdfjmvajkldfghadpsfasd',
  category: '질문',
);

class UserPage extends StatefulWidget {
  final String userId;

  const UserPage(this.userId, {super.key});

  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  final _pageController = PageController();
  int _pageIdx = 0;

  void _onPageChanged(int index) {
    setState(() {
      _pageIdx = index;
    });
  }

  Widget _buildContents() {
    return _pageIdx == 0
        ? ListView.builder(
            itemCount: 4,
            itemExtent: 240,
            itemBuilder: (context, index) {
              return _buildFeedItem(context);
            },
          )
        : ListView.builder(
            itemCount: 4,
            itemBuilder: (context, index) {
              return _buildFeedItem(context);
            },
          );
  }

  Widget _buildFeedItem(BuildContext context) {
    FeedBuilder builder = FeedBuilder(buildContext: context);
    builder.setFeed(dummyPost).setPost(dummyPost).build();

    return _pageIdx == 0
        ? builder.build()
        : DecoratedBox(
            decoration: BoxDecoration(color: Colors.black),
            child: SizedBox(width: 100, height: 100),
          );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              avatar(size: 80),
              Padding(
                padding: EdgeInsets.only(left: 15.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.userId,
                      style: const TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    FollowButton(
                      height: 25.h,
                      width: 250.w,
                      letterSpace: 40.w,
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          CustomTopNavBarDash(
            onChange: (index) {
              _onPageChanged(index);
            },
            defaultSelectedIndex: _pageIdx,
            textName: const [
              TextName.post,
              TextName.bookmark,
            ],
          ),
          Expanded(
            child: _buildContents(),
          ),
        ],
      ),
    );
  }
}
