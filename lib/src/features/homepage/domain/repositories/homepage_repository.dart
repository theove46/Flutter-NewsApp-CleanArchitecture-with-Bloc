import 'package:news_api_clean_architecture_and_bloc/src/features/homepage/domain/entities/homepage_entity.dart';

abstract class HomePageRepository {
  Future<List<HomePageEntity>> getHomePageNews();
}
