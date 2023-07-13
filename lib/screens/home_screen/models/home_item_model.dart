import 'package:equatable/equatable.dart';

class HomeItemModel extends Equatable {
  HomeItemModel({
    this.id,
    this.title,
    this.description,
    this.bannerImage,
    this.dateTime,
    this.organiserName,
    this.organiserIcon,
    this.venueName,
    this.venueCity,
    this.venueCountry,
  });

  final int? id;
  final String? title;
  final String? description;
  final String? bannerImage;
  final String? dateTime;
  final String? organiserName;
  final String? organiserIcon;
  final String? venueName;
  final String? venueCity;
  final String? venueCountry;

  HomeItemModel copyWith({
    int? id,
    String? title,
    String? description,
    String? bannerImage,
    String? dateTime,
    String? organiserName,
    String? organiserIcon,
    String? venueName,
    String? venueCity,
    String? venueCountry,
  }) {
    return HomeItemModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      bannerImage: bannerImage ?? this.bannerImage,
      dateTime: dateTime ?? this.dateTime,
      organiserName: organiserName ?? this.organiserName,
      organiserIcon: organiserIcon ?? this.organiserIcon,
      venueName: venueName ?? this.venueName,
      venueCity: venueCity ?? this.venueCity,
      venueCountry: venueCountry ?? this.venueCountry,
    );
  }

  factory HomeItemModel.fromJson(Map<String, dynamic> json) {
    return HomeItemModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      bannerImage: json['banner_image'],
      dateTime: json['date_time'],
      organiserName: json['organiser_name'],
      organiserIcon: json['organiser_icon'],
      venueName: json['venue_name'],
      venueCity: json['venue_city'],
      venueCountry: json['venue_country'],
    );
  }

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        bannerImage,
        dateTime,
        organiserName,
        organiserIcon,
        venueName,
        venueCity,
        venueCountry,
      ];
}
