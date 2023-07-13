import 'package:flutter/material.dart';
import '../screens/event_details_screen/event_details_screen.dart';
import '../screens/home_screen/home_screen.dart';
import '../screens/home_screen/models/home_item_model.dart';
import '../screens/search_screen/search_screen.dart';

class AppRoutes {
  static const String homeScreen = '/home_screen';
  static const String eventDetailsScreen = '/event_details_screen';
  static const String searchScreen = '/search_screen';
  static const String initialRoute = '/initialRoute';

  static Map<String, WidgetBuilder> get routes => {
        homeScreen: (context) => HomeScreen.builder(context),
        eventDetailsScreen: (context) => EventDetailsScreen.builder(context, model: ModalRoute.of(context)!.settings.arguments as HomeItemModel),
        searchScreen: (context) => SearchScreen.builder(context),
        initialRoute: (context) => HomeScreen.builder(context),
      };
}
