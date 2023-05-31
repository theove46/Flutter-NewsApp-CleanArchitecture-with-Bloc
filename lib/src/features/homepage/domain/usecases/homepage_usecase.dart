import 'package:news_api_clean_architecture_and_bloc/src/features/homepage/domain/entities/homepage_entity.dart';
import 'package:news_api_clean_architecture_and_bloc/src/features/homepage/domain/repositories/homepage_repository.dart';

class HomePageUseCase {
  final HomePageRepository homePageRepository;

  HomePageUseCase(this.homePageRepository);

  Future<List<HomePageEntity>> getHomePageNews() {
    return homePageRepository.getHomePageNews();
  }
}
