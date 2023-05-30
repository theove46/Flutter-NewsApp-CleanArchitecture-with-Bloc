// ignore_for_file: override_on_non_overriding_member, avoid_print, depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_api_clean_architecture_and_bloc/src/features/homepage/domain/entities/homepage_entity.dart';
import 'package:news_api_clean_architecture_and_bloc/src/features/homepage/domain/usecases/homepage_usecase.dart';
part 'home_page_event.dart';
part 'home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  final HomePageUseCase homePageUseCase;
  HomePageBloc(this.homePageUseCase) : super(HomePageInitialState()) {
    on<FetchHomePageEvent>((event, emit) async {
      try {
        emit(HomePageLoadingState());
        final news = await homePageUseCase.getHomePageNews();

        emit(HomePageLoadedState(news));
      } catch (e) {
        emit(HomePageErrorState(e.toString()));
        print(e.toString());
      }
    });
  }
}
