import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:uni_flutter/src/components/cust_confirm_dialog.dart';

class PostPage extends StatefulWidget {
  const PostPage({Key? key}) : super(key: key);

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  PostLocation _postLocation = PostLocation.common;
  String _title = "";
  String _content = "";

  void _onPressTextBtn() {
    Fluttertoast.showToast(msg: "test", textColor: Colors.black);
  }

  Future<void> _onBackBtn() async {
    if (_title.isNotEmpty || _content.isNotEmpty) {
      return showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => const CustConfirmDialog(
              title: "Confirmation",
              content: "Are you sure you want to leave this page?"));
    } else {
      Navigator.pop(context);
    }
  }

  void _onChangePostLocation(PostLocation input) {
    _postLocation = input;
  }

  void _onChangeTitle(String input) {
    _title = input;
  }

  void _onChangeContent(String input) {
    _content = input;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: TextButton(
          onPressed: _onBackBtn,
          child: const Text(
            "X", // TO-DO : change to arrow
            style: TextStyle(color: Colors.white, fontSize: 25),
          ),
        ),
        backgroundColor: Colors.blue,
        actions: [
          TextButton(
              onPressed: _onPressTextBtn,
              child: const Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                child: Text(
                  "Post",
                  style: TextStyle(color: Colors.white, fontSize: 22),
                ),
              ))
        ],
      ),
      body: Column(
        children: [
          TextField(
            decoration: const InputDecoration(hintText: "Title"),
            onChanged: (input) => _onChangeTitle(input),
          ),
          TextField(
            decoration: const InputDecoration(hintText: "Content"),
            onChanged: (input) => _onChangeContent(input),
          ),
        ],
      ),
    );
  }
}

enum PostLocation { common, company, anonymous }
