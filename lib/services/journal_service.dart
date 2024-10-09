import 'package:flutter_webapi_first_course/services/http_interceptors.dart';
import 'package:http/http.dart' as http;
import 'package:http_interceptor/http_interceptor.dart';

class JournalService {
  static const String url = "https://adidas.spotpromo.com.br/api/";
  static const String resources = "flutter_api.php";

  final http.Client _client =
      InterceptedClient.build(interceptors: [LoggerInterceptor()]);

  String _getUrl() {
    return "$url$resources";
  }

  Future<String> get() async {
    http.Response response = await _client.get(Uri.parse(_getUrl()));
    return response.body;
  }

  register(String content) {
    _client.post(Uri.parse(_getUrl()), body: {"content": content});
  }
}