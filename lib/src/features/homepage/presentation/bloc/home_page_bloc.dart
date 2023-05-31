// ignore_for_file: override_on_non_overriding_member, avoid_print, depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_api_clean_architecture_and_bloc/src/features/homepage/domain/usecases/homepage_usecase.dart';
import 'package:news_api_clean_architecture_and_bloc/src/features/homepage/presentation/bloc/home_page_state.dart';
part 'home_page_event.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  final HomePageUseCase homePageUseCase;
  HomePageBloc(this.homePageUseCase)
      : super(const HomePageState(status: HomePageStatus.initial)) {
    on<FetchHomePageEvent>((event, emit) async {
      try {
        emit(state.copyWith(status: HomePageStatus.initial));
        final news = await homePageUseCase.getHomePageNews();

        emit(state.copyWith(status: HomePageStatus.loaded, news: news));
      } catch (e) {
        emit(state.copyWith(status: HomePageStatus.error));
        print(e.toString());
      }
    });
  }
}
