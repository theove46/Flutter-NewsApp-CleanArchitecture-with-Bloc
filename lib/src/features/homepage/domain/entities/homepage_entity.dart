// ignore_for_file: must_be_immutable
import 'package:news_api_clean_architecture_and_bloc/src/features/homepage/data/models/home_models.dart';

class HomePageEntity {
  Source source;
  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  DateTime publishedAt;
  String content;

  HomePageEntity({
    required this.source,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  // @override
  // List<Object?> get props => [
  //       source,
  //       author,
  //       title,
  //       description,
  //       url,
  //       urlToImage,
  //       publishedAt,
  //       content,
  //     ];
}
