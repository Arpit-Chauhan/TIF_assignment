part of 'search_bloc.dart';

class SearchState extends Equatable {
  final SearchModel searchModelObj;
  final String? error;

  SearchState({
    required this.searchModelObj,
    this.error,
  });

  @override
  List<Object?> get props => [searchModelObj, error];

  SearchState copyWith({
    SearchModel? searchModelObj,
    String? error,
  }) {
    return SearchState(
      searchModelObj: searchModelObj ?? this.searchModelObj,
      error: error ?? this.error,
    );
  }
}
