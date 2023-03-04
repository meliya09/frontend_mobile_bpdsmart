import 'package:http/http.dart' as http;

import '../../../models/SearchMenu/search_model.dart';

class ApiService {
  http.Client client = http.Client();

  Future<Search?> getSearch(String query) async {
    final http.Response response = await client
        .get(Uri.parse('http://192.168.100.215:8080/search/$query'));
    // 'https://newsapi.org/v2/everything?q=$query&apiKey=a8f4865d4cea4cd8ac1b34a197d22d99'));
    if (response.statusCode == 200) {
      final String jsonString = response.body;
      return searchFromJson(jsonString);
    } else {
      throw Exception('Failed to load');
    }
  }
}
