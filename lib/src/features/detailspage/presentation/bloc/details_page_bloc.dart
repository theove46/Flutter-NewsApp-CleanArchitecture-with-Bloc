// ignore_for_file: depend_on_referenced_packages, avoid_print

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'details_page_event.dart';
part 'details_page_state.dart';

class DetailsPageBloc extends Bloc<DetailsPageEvent, DetailsPageState> {
  DetailsPageBloc() : super(DetailsPageInitialState()) {
    on<FetchDetailsPageEvent>((event, emit) async {
      try {
        emit(DetailsPageLoadingState());
        emit(DetailsPageLoadedState());
      } catch (e) {
        emit(DetailsPageErrorState(e.toString()));
        print(e.toString());
      }
    });
  }
}
