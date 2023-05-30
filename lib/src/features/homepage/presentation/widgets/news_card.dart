import 'package:flutter/material.dart';
import 'package:news_api_clean_architecture_and_bloc/src/core/router/routing_constant.dart';
import 'package:news_api_clean_architecture_and_bloc/src/core/theme/colors.dart';
import 'package:news_api_clean_architecture_and_bloc/src/features/homepage/domain/entities/homepage_entity.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({Key? key, required this.news}) : super(key: key);
  final HomePageEntity news;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4.0),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.network(
                  news.urlToImage,
                  height: 160,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  bottom: 6,
                  right: 6,
                  child: SizedBox(
                    height: 70,
                    width: 70,
                    child: Image.network(
                      'https://download.logo.wine/logo/BBC_News/BBC_News-Logo.wine.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    news.title,
                    maxLines: 1,
                    style: const TextStyle(
                      fontSize: 24,
                      color: Pallete.blackColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(height: 10),
                  Text(
                    news.source.name,
                    maxLines: 2,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[700],
                    ),
                  ),
                  Container(height: 6),
                  Text(
                    news.description,
                    maxLines: 2,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[700],
                    ),
                  ),
                  Row(
                    children: [
                      const Spacer(),
                      TextButton(
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.transparent,
                        ),
                        child: const Text(
                          "SHARE",
                          style: TextStyle(color: Pallete.blackColor),
                        ),
                        onPressed: () {},
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.transparent,
                        ),
                        child: const Text(
                          "EXPLORE",
                          style: TextStyle(color: Pallete.redColor),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, detailsPageRoute,
                              arguments: news);
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              height: 5,
            ),
          ],
        ),
      ),
    );
  }
}
