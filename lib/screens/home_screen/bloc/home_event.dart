// ignore_for_file: must_be_immutable

part of 'home_bloc.dart';

@immutable
abstract class HomeEvent extends Equatable {}


class HomeInitialEvent extends HomeEvent {
  @override
  List<Object?> get props => [];
}

class HomeItemEvent extends HomeEvent {
  HomeItemEvent({
    required this.index,
  });

  int index;

  @override
  List<Object?> get props => [
        index,
      ];
}
