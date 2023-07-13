part of 'search_bloc.dart';

@immutable
abstract class SearchEvent extends Equatable {
  const SearchEvent();
}

class SearchInitialEvent extends SearchEvent {
  @override
  List<Object?> get props => [];
}

class SearchQueryChangedEvent extends SearchEvent {
  String query;

   SearchQueryChangedEvent(this.query);

  @override
  List<Object?> get props => [query];
}
