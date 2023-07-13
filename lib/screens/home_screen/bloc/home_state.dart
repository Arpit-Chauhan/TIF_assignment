// ignore_for_file: must_be_immutable

part of 'home_bloc.dart';

class HomeState extends Equatable {
  HomeState({
    this.homeModelObj,
    this.isLoading = false,
  });

  final HomeModel? homeModelObj;
  final bool isLoading;

  @override
  List<Object?> get props => [
        homeModelObj,
        isLoading,
      ];

  HomeState copyWith({
    String? radioGroup,
    String? radioGroup1,
    HomeModel? homeModelObj,
    bool? isLoading,
  }) {
    return HomeState(
      homeModelObj: homeModelObj ?? this.homeModelObj,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
