import 'package:uni_flutter/src/service/base_service.dart';

class HealthCheckService {
  final BaseService _baseService = BaseService();

  Future<String> healthCheckRequest() async {
    return await _baseService.baseRequest("/health");
  }
}
