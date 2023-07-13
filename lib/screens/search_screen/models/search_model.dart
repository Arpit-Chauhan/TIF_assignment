// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import '../../home_screen/models/home_item_model.dart';

class SearchModel extends Equatable {
  SearchModel({this.searchItemList = const []});

  List<HomeItemModel> searchItemList;

  SearchModel copyWith({List<HomeItemModel>? searchItemList}) {
    return SearchModel(
      searchItemList: searchItemList ?? this.searchItemList,
    );
  }

  @override
  List<Object?> get props => [searchItemList];
}
