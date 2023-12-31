
import 'package:equatable/equatable.dart';

import 'home_item_model.dart';

class HomeModel extends Equatable {
  HomeModel({this.homeItemList = const []});

  List<HomeItemModel> homeItemList;

  HomeModel copyWith({List<HomeItemModel>? homeItemList}) {
    return HomeModel(
      homeItemList: homeItemList ?? this.homeItemList,
    );
  }

  @override
  List<Object?> get props => [homeItemList];
}