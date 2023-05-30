import 'package:news_api_clean_architecture_and_bloc/src/features/homepage/data/datasources/homepage_datasource.dart';
import 'package:news_api_clean_architecture_and_bloc/src/features/homepage/domain/entities/homepage_entity.dart';
import 'package:news_api_clean_architecture_and_bloc/src/features/homepage/domain/repositories/homepage_repository.dart';

class HomePageRepositoryImpl implements HomePageRepository {
  final HomePageDataSource homePageDataSource;

  HomePageRepositoryImpl(this.homePageDataSource);

  @override
  Future<List<HomePageEntity>> getHomePageNews() {
    return homePageDataSource.getHomePageNews();
  }
}
