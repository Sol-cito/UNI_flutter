import 'package:http/http.dart' as http;

Future<String> loginRequest(String inputUrl) async {
  var url = Uri.parse(inputUrl);
  final response = await http.get(url);

  if (response.statusCode == 200) {
    return response.body;
  } else {
    throw Exception(response.reasonPhrase);
  }
}
