import 'dart:convert';

import 'package:news_app/core/constants/variables.dart';
import 'package:news_app/data/models/news_model.dart';
import 'package:http/http.dart' as http;

class NewsDatasource {
  Future<NewsModel> getNews() async {
    final response = await http.get(
      Uri.parse(
          '${Variables.baseUrl}/top-headlines?country=us&apiKey=${Variables.apiKey}'),
    );
    if (response.statusCode == 200) {
      return NewsModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load News');
    }
  }
}
