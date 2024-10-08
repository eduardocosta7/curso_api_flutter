import 'package:http/http.dart' as http;

class JournalService {
  static const String url = "https://adidas.spotpromo.com.br/api/";
  static const String resources = "flutter_api.php";

  String _getUrl() {
    return "$url$resources";
  }

  Future<String> get() async {
     http.Response response = await http.get(Uri.parse(_getUrl()));
     return response.body;
  }

  register(String content) {
    http.post(Uri.parse(_getUrl()), body: { "content" : content });
  }
}