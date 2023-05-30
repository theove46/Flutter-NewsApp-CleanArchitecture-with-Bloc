part of 'home_page_bloc.dart';

abstract class HomePageState extends Equatable {
  const HomePageState();
  @override
  List<Object> get props => [];
}

class HomePageInitialState extends HomePageState {}

class HomePageLoadingState extends HomePageState {}

class HomePageLoadedState extends HomePageState {
  final List<HomePageEntity> news;

  const HomePageLoadedState(this.news);
  @override
  List<Object> get props => [news];
}

class HomePageErrorState extends HomePageState {
  final String errorMessage;

  const HomePageErrorState(this.errorMessage);
  @override
  List<Object> get props => [errorMessage];
}
