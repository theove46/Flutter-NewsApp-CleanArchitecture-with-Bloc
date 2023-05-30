import 'package:flutter/material.dart';
import 'package:news_api_clean_architecture_and_bloc/src/core/router/routing_constant.dart';
import 'package:news_api_clean_architecture_and_bloc/src/features/detailspage/presentation/views/details_page_view.dart';
import 'package:news_api_clean_architecture_and_bloc/src/features/homepage/domain/entities/homepage_entity.dart';
import 'package:news_api_clean_architecture_and_bloc/src/features/homepage/presentation/views/home_page_view.dart';

Route<dynamic>? generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case homePageRoute:
      return MaterialPageRoute(builder: (context) => const HomePage());

    case detailsPageRoute:
      return MaterialPageRoute(
        builder: (context) => DetailsPage(
          news: settings.arguments as HomePageEntity,
        ),
      );

    default:
      return null;
  }
}
