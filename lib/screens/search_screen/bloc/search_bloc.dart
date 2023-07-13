import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:tif/screens/home_screen/models/home_item_model.dart';
import '../models/search_model.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc(SearchState initialState) : super(initialState) {
    on<SearchInitialEvent>(_onInitialize);
    on<SearchQueryChangedEvent>(_onSearchQueryChanged);
  }

  void _onInitialize(
    SearchInitialEvent event,
    Emitter<SearchState> emit,
  ) async {
    final initialSearchModel = SearchModel(searchItemList: []);
    emit(state.copyWith(searchModelObj: initialSearchModel));

    if (state.searchModelObj.searchItemList.isEmpty) {
      await _fetchSearchResults("");
    }
  }

  void _onSearchQueryChanged(
    SearchQueryChangedEvent event,
    Emitter<SearchState> emit,
  ) async {
    await _fetchSearchResults(event.query);
  }

  Future<void> _fetchSearchResults(String query) async {
    try {
      final url = 'https://sde-007.api.assignment.theinternetfolks.works/v1/event?search=${query}';
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        final data = jsonData['content']['data'];
        final searchResults = List<HomeItemModel>.from(data.map((item) => HomeItemModel(
              id: item['id'],
              title: item['title'],
              description: item['description'],
              bannerImage: item['banner_image'],
              dateTime: item['date_time'],
              organiserName: item['organiser_name'],
              organiserIcon: item['organiser_icon'],
              venueName: item['venue_name'],
              venueCity: item['venue_city'],
              venueCountry: item['venue_country'],
            )));

        emit(state.copyWith(searchModelObj: state.searchModelObj.copyWith(searchItemList: searchResults)));
      } else {
        emit(state.copyWith(error: 'Error fetching search results'));
      }
    } catch (error) {
      emit(state.copyWith(error: 'An unexpected error occurred'));
    }
  }
}
