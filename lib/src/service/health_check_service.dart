import 'package:uni_flutter/src/service/base_service.dart';

Future<String> healthCheckRequest() async {
  return await baseRequest("/health");
}
