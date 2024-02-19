import 'package:http/http.dart' as http;
import 'dart:convert';

const url = 'https://imdb-top-100-movies.p.rapidapi.com';
const headers = {
  'X-RapidAPI-Key': '43f7a79e2dmshf570a96b3663ae1p1864e4jsn2548c63d1000',
  'X-RapidAPI-Host': 'imdb-top-100-movies.p.rapidapi.com'
};

class Api {
  Future<dynamic> fetch() async {
    final response = await http.get(Uri.parse(url), headers: headers);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception("Failed to load");
    }
  }
}
