import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:uni_flutter/src/service/storage_service.dart';

class MockFlutterSecureStorage extends Mock implements FlutterSecureStorage {}

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  late MockFlutterSecureStorage mockFlutterSecureStorage;
  late StorageService storageService;
  const String inputKey = "login";

  setUp(() {
    mockFlutterSecureStorage = MockFlutterSecureStorage();
    storageService = StorageService();
  });

  group("FlutterSecureStorage test", () {
    test("If storage contains login value, return true", () async {
      FlutterSecureStorage.setMockInitialValues({"login": "loggedIn"});

      when(() => mockFlutterSecureStorage.read(key: inputKey))
          .thenAnswer((_) async => "loggedIn");

      bool isLoggedIn = await storageService.checkIfAlreadyLoggedInByStorage();
      expect(isLoggedIn, true);
    });

    test("If storage doesn't contain login value, return false", () async {
      FlutterSecureStorage.setMockInitialValues({});

      when(() => mockFlutterSecureStorage.read(key: inputKey))
          .thenAnswer((_) async => "loggedIn");

      bool isLoggedIn = await storageService.checkIfAlreadyLoggedInByStorage();
      expect(isLoggedIn, false);
    });
  });
}
