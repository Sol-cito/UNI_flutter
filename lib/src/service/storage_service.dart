import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class StorageService {
  Future<bool> checkIfAlreadyLoggedInByStorage() async {
    const String key = "login";

    const flutterSecureStorage = FlutterSecureStorage();
    String? loginInfo = await flutterSecureStorage.read(key: key);
    if (loginInfo == null) {
      return false;
    }
    return true;
  }
}
