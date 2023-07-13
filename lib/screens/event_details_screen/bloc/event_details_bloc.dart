import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../home_screen/models/home_item_model.dart';
import '../models/event_details_model.dart';

part 'event_details_event.dart';
part 'event_details_state.dart';

class EventDetailsBloc extends Bloc<EventDetailsEvent, EventDetailsState> {
  EventDetailsBloc(EventDetailsState initialState) : super(initialState) {
    on<EventDetailsInitialEvent>(_onInitialize);
  }

  void _onInitialize(
    EventDetailsInitialEvent event,
    Emitter<EventDetailsState> emit,
  ) {
     final homeItemModel = event.model;
    emit(state.copyWith(
      eventDetailsModelObj: state.eventDetailsModelObj!.copyWith(
        homeItemModel: event.model,
      ),
    ));
  }
}