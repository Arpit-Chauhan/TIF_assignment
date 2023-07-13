// ignore_for_file: must_be_immutable

part of 'event_details_bloc.dart';

@immutable
abstract class EventDetailsEvent extends Equatable {}


class EventDetailsInitialEvent extends EventDetailsEvent {
  final HomeItemModel model;

  EventDetailsInitialEvent({required this.model});

  @override
  List<Object?> get props => [model];
}
