import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tif/screens/home_screen/models/home_item_model.dart';

import '../../routes/app_routes.dart';
import '../../utils/app_style.dart';
import '../../utils/color_constants.dart';
import '../../utils/scaling.dart';
import '../../utils/widgets/custom_image_view.dart';
import '../search_screen/widgets/search_item_widget.dart';
import 'bloc/search_bloc.dart';
import 'models/search_model.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<SearchBloc>(
        create: (context) => SearchBloc(SearchState(searchModelObj: SearchModel()))..add(SearchInitialEvent()), child: SearchScreen());
  }

  @override
  Widget build(BuildContext context) {
    ScalingUtility scale = ScalingUtility(context: context)..setCurrentDeviceSize();
    String? text;
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.whiteA700,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: Row(
            children: [
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Padding(
                  padding: scale.getPadding(top: 9),
                  child: CustomImageView(
                    height: scale.getScaledHeight(
                      24,
                    ),
                    width: scale.getScaledWidth(
                      24,
                    ),
                    svgPath: 'assets/images/img_arrowleft.svg',
                    color: ColorConstant.gray900,
                    margin: scale.getMargin(
                      left: 24,
                      right: 3,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: scale.getPadding(left: 8, top: 9),
                child: Text(
                  'Search',
                  style: AppStyle.txtInterMedium24,
                ),
              ),
            ],
          ),
        ),
        body: BlocConsumer<SearchBloc, SearchState>(
            listener: (context, state) {},
            builder: (context, state) {
              return Container(
                width: double.maxFinite,
                padding: scale.getPadding(left: 21, top: 17, right: 21, bottom: 17),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: scale.getPadding(top: 11),
                      child: TextField(
                        autofocus: true,
                        cursorColor: Color(0xFF7974E7),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Type Event Name',
                          hintStyle: AppStyle.txtInterRegular20.copyWith(color: ColorConstant.blueGray400),
                          prefixIcon: Container(
                            child: CustomImageView(
                              svgPath: 'assets/images/img_searchIndigo.svg',
                              height: scale.getScaledHeight(24),
                              width: scale.getScaledWidth(24),
                              margin: scale.getMargin(right: 9, top: 4),
                            ),
                          ),
                          prefixIconConstraints: BoxConstraints.loose(Size(36, 36)),
                        ),
                        onChanged: (query) {
                          text = query;
                          BlocProvider.of<SearchBloc>(context).add(SearchQueryChangedEvent(query));
                        },
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: scale.getPadding(top: 16, right: 6),
                        child: BlocBuilder<SearchBloc, SearchState>(
                          builder: (context, state) {
                            final searchModelObj = state.searchModelObj;
                            if (searchModelObj == null) {
                              return Center(child: CircularProgressIndicator());
                            } else if (searchModelObj.searchItemList.isEmpty && text != "") {
                              return Center(
                                  child: Text(
                                'No Events Found!',
                                style: AppStyle.txtInterMedium18,
                              ));
                            }
                            return ListView.separated(
                              physics: BouncingScrollPhysics(),
                              shrinkWrap: true,
                              separatorBuilder: (context, index) {
                                return SizedBox(height: scale.getScaledHeight(16));
                              },
                              itemCount: searchModelObj.searchItemList.length,
                              itemBuilder: (context, index) {
                                HomeItemModel model = searchModelObj.searchItemList[index] as HomeItemModel;
                                return InkWell(
                                    onTap: () {
                                      Navigator.pushNamed(context, AppRoutes.eventDetailsScreen, arguments: model);
                                    },
                                    child: SearchItemWidget(model as HomeItemModel));
                              },
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
