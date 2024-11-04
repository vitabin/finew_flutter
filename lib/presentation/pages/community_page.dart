import 'package:flutter/material.dart';
import '../../domain/entities/comment.dart';
import '../../domain/entities/feed.dart';
import '../components/custom_bottom_nav_bar_dash.dart';
import '../components/feed.dart';
import '../icons/icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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

class CommunityPage extends StatefulWidget {
  const CommunityPage({super.key});

  @override
  _CommunityPageState createState() => _CommunityPageState();
}

class _CommunityPageState extends State<CommunityPage> {
  @override
  Widget build(BuildContext context) {
    FeedBuilder builder = FeedBuilder(buildContext: context);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          scrolledUnderElevation: 0,
          title: const Text(
            '커뮤니티',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: 4,
        itemExtent: 240.h,
        itemBuilder: (context, index) {
          return IntrinsicHeight(
            child: builder.setFeed(dummyPost).setPost(dummyPost).build(),
          );
        },
      ),
      bottomNavigationBar: CustomBottomNavBarDash(
        onChange: (index) {
          setState(() {});
        },
        defaultSelectedIndex: 0,
        svgName: const [
          AssetName.list,
          AssetName.plus,
          AssetName.bookmark,
        ],
      ),
    );
  }
}
