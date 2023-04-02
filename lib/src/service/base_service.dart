import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

Future<String> baseRequest(String apiUrl) async {
  String baseUrl = dotenv.env['BASE_URL'] ?? "http://10.0.2.2:8081";
  var url = Uri.parse(baseUrl + apiUrl);
  final response = await http.get(url);

  if (response.statusCode == 200) {
    return response.body;
  } else {
    throw Exception(response.reasonPhrase);
  }
}
