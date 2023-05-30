// ignore_for_file: must_be_immutable

import 'package:news_api_clean_architecture_and_bloc/src/features/homepage/domain/entities/homepage_entity.dart';

class NewsModel extends HomePageEntity {
  NewsModel({
    required Source source,
    required String author,
    required String title,
    required String description,
    required String url,
    required String urlToImage,
    required DateTime publishedAt,
    required String content,
  }) : super(
          source: source,
          author: author,
          title: title,
          description: description,
          url: url,
          urlToImage: urlToImage,
          publishedAt: publishedAt,
          content: content,
        );

  factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
        source: Source.fromJson(json["source"]),
        author: json["author"] ?? 'Behind the secret',
        title: json["title"] ?? 'Non title',
        description: json["description"] ?? ' ',
        url: json["url"] ??
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQn4pXvg4RQtlqbkDymFjAC481hWnnd-BQO2Q&usqp=CAU',
        urlToImage: json["urlToImage"] ??
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQn4pXvg4RQtlqbkDymFjAC481hWnnd-BQO2Q&usqp=CAU',
        publishedAt: DateTime.parse(json["publishedAt"]),
        content: json["content"] ?? ' ',
      );

  Map<String, dynamic> toJson() => {
        "source": source.toJson(),
        "author": author,
        "title": title,
        "description": description,
        "url": url,
        "urlToImage": urlToImage,
        "publishedAt": publishedAt.toIso8601String(),
        "content": content,
      };
}

class Source {
  dynamic id;
  String name;

  Source({
    this.id,
    required this.name,
  });

  factory Source.fromJson(Map<String, dynamic> json) => Source(
        id: json["id"],
        name: json["name"] ?? 'Behind the secret',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
