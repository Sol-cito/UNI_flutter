import 'package:flutter/material.dart';
import 'package:uni_flutter/src/components/bottom_nav_bar.dart';
import 'package:uni_flutter/src/components/home_app_bar.dart';
import 'package:uni_flutter/src/components/post_box.dart';
import 'package:uni_flutter/src/models/post_model.dart';
import 'package:uni_flutter/src/service/post_service.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final PostService postService = PostService();
  List<PostBoxModel> postBoxList = [];
  int _postOffset = 0;
  final int _postLimit = 10;

  @override
  void initState() {
    super.initState();
    getPostBoxes();
  }

  void getPostBoxes() async {
    List<PostBoxModel> result =
        await postService.getPostBoxes(_postOffset, _postLimit);

    setState(() {
      postBoxList.addAll(result);
      _postOffset += 10;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: const HomeAppBar(),
          body: ListView(
              children: List<PostBox>.generate(postBoxList.length, (idx) {
            return PostBox(postBoxModel: postBoxList[idx]);
          }).toList()),
          bottomNavigationBar: const BottomNavBar()),
    );
  }
}
