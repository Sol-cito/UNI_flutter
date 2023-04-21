import 'package:uni_flutter/src/models/user_model.dart';

class PostBoxModel {
  final int id;
  final UserModel poster;
  final String content;
  final DateTime lastUpdatedDate;
  final int numberOfReply;
  final int numberOfLike;

  PostBoxModel(this.id, this.poster, this.content, this.lastUpdatedDate,
      this.numberOfReply, this.numberOfLike);
}

class PostDetailModel {}
