import 'package:uni_flutter/src/models/post_model.dart';
import 'package:uni_flutter/src/models/user_model.dart';
import 'package:uni_flutter/src/service/base_service.dart';

class PostService {
  BaseService _baseService = BaseService();

  final List<PostBoxModel> _testPostBoxList = [
    PostBoxModel(1, UserModel("test user 1"), "test contest1",
        DateTime(2022, DateTime.april, 11), 1, 0),
    PostBoxModel(2, UserModel("test user 2"), "test contest2",
        DateTime(2022, DateTime.april, 11), 2, 0),
    PostBoxModel(3, UserModel("test user 3"), "test contest3",
        DateTime(2022, DateTime.april, 11), 0, 3),
    PostBoxModel(4, UserModel("test user 4"), "test contest4",
        DateTime(2022, DateTime.april, 11), 0, 4),
    PostBoxModel(5, UserModel("test user 5"), "test contest5",
        DateTime(2022, DateTime.april, 11), 2, 0),
    PostBoxModel(6, UserModel("test user 6"), "test contest6",
        DateTime(2022, DateTime.april, 11), 0, 6),
  ];

  getPostBoxes(int offset, int limit) async {
    // TO-DO
    return _testPostBoxList;
  }
}
