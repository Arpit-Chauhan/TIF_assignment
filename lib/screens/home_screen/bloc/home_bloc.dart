import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import '../models/home_item_model.dart';
import '../models/home_model.dart';
part 'home_event.dart';
part 'home_state.dart';

/// A bloc that manages the state of a Home according to the event that is dispatched to it.
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(HomeState initialState) : super(initialState) {
    on<HomeInitialEvent>(_onInitialize);
    on<HomeItemEvent>(_homeItem);
  }
  
  _homeItem(
    HomeItemEvent event,
    Emitter<HomeState> emit,
  ) {
  }

  List<HomeItemModel> fillHomeItemList() {
    return List.generate(4, (index) => HomeItemModel());
  }

  _onInitialize(
    HomeInitialEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    final response = await http.get(Uri.parse('https://sde-007.api.assignment.theinternetfolks.works/v1/event'));
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final data = jsonData['content']['data'] as List<dynamic>;
      final List<HomeItemModel> homeItemList = data.map((item) {
        return HomeItemModel.fromJson(item);
      }).toList();
      emit(state.copyWith(
      homeModelObj: state.homeModelObj?.copyWith(homeItemList: homeItemList),
      isLoading: false,
    ));
    } else {
      print('API call failed with status code: ${response.statusCode}');
    emit(state.copyWith(isLoading: false));
    }
  }
}
