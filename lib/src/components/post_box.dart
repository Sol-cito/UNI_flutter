import 'package:flutter/material.dart';
import 'package:uni_flutter/src/models/post_model.dart';

class PostBox extends StatelessWidget {
  final PostBoxModel postBoxModel;

  const PostBox({Key? key, required this.postBoxModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: 100,
      decoration: BoxDecoration(
        border: Border.all(),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text(postBoxModel.poster.name),
              Text(postBoxModel.lastUpdatedDate.year.toString())
            ],
          ),
          Text(postBoxModel.content),
          Row(
            children: [
              Text("Like ${postBoxModel.numberOfLike}"),
              Text("${postBoxModel.numberOfReply}")
            ],
          )
        ],
      ),
    );
  }
}
