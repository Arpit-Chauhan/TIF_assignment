import 'package:equatable/equatable.dart';
import '../../home_screen/models/home_item_model.dart';

class EventDetailsModel extends Equatable {
  final HomeItemModel homeItemModel;

  EventDetailsModel({required this.homeItemModel});

  EventDetailsModel copyWith({required HomeItemModel homeItemModel}) {
    return EventDetailsModel(
      homeItemModel: homeItemModel ?? this.homeItemModel,
    );
  }

  @override
  List<Object?> get props => [homeItemModel];
}
