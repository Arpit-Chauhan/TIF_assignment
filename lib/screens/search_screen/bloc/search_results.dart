import 'package:tif/screens/search_screen/bloc/search_bloc.dart';

class SearchResults extends SearchEvent {
  final String query;

  const SearchResults(this.query);

  @override
  List<Object?> get props => [query];
}
