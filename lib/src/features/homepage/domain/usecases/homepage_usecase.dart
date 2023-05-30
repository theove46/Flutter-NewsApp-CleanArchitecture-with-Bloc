import 'package:news_api_clean_architecture_and_bloc/src/features/homepage/domain/entities/homepage_entity.dart';
import 'package:news_api_clean_architecture_and_bloc/src/features/homepage/domain/repositories/homepage_repository.dart';

class HomePageUseCase {
  final HomePageRepository homePageRepository;

  HomePageUseCase(this.homePageRepository);

  Future<List<HomePageEntity>> getHomePageNews() async {
    try {
      return await homePageRepository.getHomePageNews();
    } catch (e) {
      throw Exception('Failed to fetch top headlines');
    }
  }
}
