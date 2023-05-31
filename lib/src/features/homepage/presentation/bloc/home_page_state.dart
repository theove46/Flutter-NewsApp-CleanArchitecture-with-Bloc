import 'package:equatable/equatable.dart';
import 'package:news_api_clean_architecture_and_bloc/src/features/homepage/domain/entities/homepage_entity.dart';

enum HomePageStatus { initial, loading, loaded, error }

class HomePageState extends Equatable {
  const HomePageState({
    this.status = HomePageStatus.initial,
    this.news = const <HomePageEntity>[],
  });

  final HomePageStatus status;
  final List<HomePageEntity> news;

  HomePageState copyWith({
    HomePageStatus? status,
    List<HomePageEntity>? news,
  }) {
    return HomePageState(
      status: status ?? this.status,
      news: news ?? this.news,
    );
  }

  @override
  String toString() {
    return 'PostState { status: $status, news: ${news.length} }';
  }

  @override
  List<Object?> get props => [status, news];
}
