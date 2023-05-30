import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_api_clean_architecture_and_bloc/src/features/homepage/data/models/home_models.dart';
import 'package:news_api_clean_architecture_and_bloc/src/features/homepage/domain/entities/homepage_entity.dart';

abstract class HomePageDataSource {
  Future<List<HomePageEntity>> getHomePageNews();
}

class HomePageDataSourceImpl implements HomePageDataSource {
  @override
  Future<List<HomePageEntity>> getHomePageNews() async {
    const url =
        'https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=674dd4773b7542e1b70ac639b6806a54';
    final uri = Uri.parse(url);
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData = jsonDecode(response.body);
      final List<HomePageEntity> news = (jsonData['articles'] as List<dynamic>)
          .map((itemJson) => NewsModel.fromJson(itemJson))
          .toList();
      return news;
    } else {
      throw Exception('Failed to fetch posts');
    }
  }
}
