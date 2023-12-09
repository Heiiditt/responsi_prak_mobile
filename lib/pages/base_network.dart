import 'dart:convert';
import 'package:http/http.dart' as http;

class SportsApiClient {
  static const String baseUrl =
      'https://www.themealdb.com/api/json/v1/1/categories.php';

  Future<Map<String, dynamic>> fetchData() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      return data;
    } else {
      throw Exception('Failed to fetch data');
    }
  }
}