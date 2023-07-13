import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tif/screens/home_screen/widgets/home_item_widget.dart';
import '../../routes/app_routes.dart';
import '../../utils/app_style.dart';
import '../../utils/color_constants.dart';
import '../../utils/scaling.dart';
import '../../utils/widgets/custom_image_view.dart';
import 'bloc/home_bloc.dart';
import 'models/home_item_model.dart';
import 'models/home_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<HomeBloc>(
      create: (context) => HomeBloc(HomeState(
        homeModelObj: HomeModel(),
      ))
        ..add(HomeInitialEvent()),
      child: HomeScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    ScalingUtility scale = ScalingUtility(context: context)..setCurrentDeviceSize();
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.whiteA700,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: Row(
            children: [
              Padding(
                padding: scale.getPadding(left: 31, top: 10),
                child: Text(
                  'Events',
                  style: AppStyle.txtInterMedium24,
                ),
              ),
            ],
          ),
          actions: [
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.searchScreen);
              },
              child: CustomImageView(
                height: scale.getScaledHeight(
                  24,
                ),
                width: scale.getScaledWidth(
                  24,
                ),
                svgPath: 'assets/images/img_search.svg',
                margin: scale.getMargin(
                  left: 24,
                  top: 9,
                  right: 3,
                ),
              ),
            ),
            CustomImageView(
              height: scale.getScaledHeight(
                22,
              ),
              width: scale.getScaledWidth(
                22,
              ),
              svgPath: 'assets/images/img_overflowMenu.svg',
              margin: scale.getMargin(
                left: 16,
                top: 9,
                right: 27,
                bottom: 2,
              ),
            ),
          ],
        ),
        body: BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
          if (state.isLoading) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  Text(
                    'Fetching Data !',
                    style: AppStyle.txtInterMedium15,
                  ),
                ],
              ),
            );
          } else {
            return SingleChildScrollView(
              child: Container(
                width: double.maxFinite,
                padding: scale.getPadding(
                  left: 24,
                  right: 24,
                  bottom: 7,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: scale.getPadding(
                        top: 7,
                      ),
                      child: BlocSelector<HomeBloc, HomeState, HomeModel?>(
                        selector: (state) => state.homeModelObj,
                        builder: (context, homeModelObj) {
                          return ListView.separated(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            separatorBuilder: (
                              context,
                              index,
                            ) {
                              return SizedBox(
                                height: scale.getScaledHeight(
                                  12,
                                ),
                              );
                            },
                            itemCount: homeModelObj?.homeItemList.length ?? 0,
                            itemBuilder: (context, index) {
                              HomeItemModel model = homeModelObj?.homeItemList[index] ?? HomeItemModel();
                              return InkWell(
                                onTap: () {
                                  Navigator.pushNamed(context, AppRoutes.eventDetailsScreen, arguments: model);
                                },
                                child: HomeItemWidget(
                                  model,
                                  onTapRadio: (value) {
                                    context.read<HomeBloc>().add(HomeItemEvent(
                                          index: index,
                                        ));
                                  },
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        }),
      ),
    );
  }
}
