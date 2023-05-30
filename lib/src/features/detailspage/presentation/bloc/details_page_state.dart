part of 'details_page_bloc.dart';

abstract class DetailsPageState extends Equatable {
  const DetailsPageState();

  @override
  List<Object> get props => [];
}

class DetailsPageInitialState extends DetailsPageState {}

class DetailsPageLoadingState extends DetailsPageState {}

class DetailsPageLoadedState extends DetailsPageState {}

class DetailsPageErrorState extends DetailsPageState {
  final String errorMessage;

  const DetailsPageErrorState(this.errorMessage);
  @override
  List<Object> get props => [errorMessage];
}
