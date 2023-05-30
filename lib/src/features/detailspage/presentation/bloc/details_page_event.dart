part of 'details_page_bloc.dart';

abstract class DetailsPageEvent extends Equatable {
  const DetailsPageEvent();

  @override
  List<Object> get props => [];
}

class FetchDetailsPageEvent extends DetailsPageEvent {}
