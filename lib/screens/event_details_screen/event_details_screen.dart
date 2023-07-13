import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../../utils/app_decoration.dart';
import '../../utils/app_style.dart';
import '../../utils/color_constants.dart';
import '../../utils/scaling.dart';
import '../../utils/widgets/appBar_image.dart';
import '../../utils/widgets/custom_app_bar.dart';
import '../../utils/widgets/custom_icon_button.dart';
import '../../utils/widgets/custom_image_view.dart';
import '../home_screen/models/home_item_model.dart';
import 'bloc/event_details_bloc.dart';
import 'models/event_details_model.dart';
import 'package:flutter/material.dart';

class EventDetailsScreen extends StatelessWidget {
  final HomeItemModel model;

  const EventDetailsScreen({Key? key, required this.model}) : super(key: key);

  static Widget builder(BuildContext context, {required HomeItemModel model}) {
    return BlocProvider<EventDetailsBloc>(
      create: (context) => EventDetailsBloc(EventDetailsState(eventDetailsModelObj: EventDetailsModel(homeItemModel: model)))
        ..add(EventDetailsInitialEvent(model: model)),
      child: EventDetailsScreen(
        model: model,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    ScalingUtility scale = ScalingUtility(context: context)..setCurrentDeviceSize();

    return BlocBuilder<EventDetailsBloc, EventDetailsState>(builder: (context, state) {
      return SafeArea(
        child: Scaffold(
          backgroundColor: ColorConstant.whiteA700,
          body: SizedBox(
            width: double.maxFinite,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                    height: scale.getScaledHeight(177),
                    width: double.maxFinite,
                    child: Stack(alignment: Alignment.topCenter, children: [
                      Image.network(
                        state.eventDetailsModelObj?.homeItemModel?.bannerImage ?? '',
                        height: scale.getScaledHeight(177),
                        width: scale.getScaledWidth(375),
                        alignment: Alignment.center,
                        fit: BoxFit.fill,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        },
                        errorBuilder: (context, error, stackTrace) {
                          return CustomImageView(
                            imagePath: 'assets/images/image_not_found.png',
                            height: scale.getScaledHeight(
                              177,
                            ),
                            width: scale.getScaledWidth(
                              375,
                            ),
                            radius: BorderRadius.circular(
                              scale.getScaledHeight(
                                10,
                              ),
                            ),
                            alignment: Alignment.center,
                          );
                        },
                      ),
                      CustomAppBar(
                          height: scale.getScaledHeight(56),
                          leadingWidth: 46,
                          leading: AppbarImage(
                              height: scale.getScaledHeight(22),
                              width: scale.getScaledWidth(22),
                              svgPath: 'assets/images/img_arrowleft.svg',
                              margin: scale.getMargin(left: 24, top: 20, bottom: 20),
                              onTap: () {
                                Navigator.pop(context);
                              }),
                          title: Padding(
                              padding: scale.getPadding(left: 13),
                              child: Text("Event Details",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtInterRegular20.copyWith(fontSize: 24, color: ColorConstant.whiteA700))),
                          actions: [
                            Container(
                                margin: scale.getMargin(left: 20, right: 20, top: 8, bottom: 14),
                                padding: scale.getPadding(all: 10),
                                decoration: AppDecoration.fillWhiteA7004c.copyWith(borderRadius: BorderRadiusStyle.roundedBorder10),
                                child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                                  AppbarImage(
                                      height: scale.getScaledHeight(14),
                                      width: scale.getScaledWidth(15),
                                      svgPath: 'assets/images/img_bookmark.svg',
                                      margin: scale.getMargin(bottom: 1))
                                ]))
                          ],
                          styleType: Style.bgGradientBlack90096Black90000)
                    ])),
                Expanded(
                  child: SingleChildScrollView(
                    padding: scale.getPadding(top: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: scale.getScaledWidth(299),
                          margin: scale.getMargin(left: 24, right: 51),
                          child: Text("${state.eventDetailsModelObj?.homeItemModel?.title ?? ''}",
                              maxLines: null, textAlign: TextAlign.left, style: AppStyle.txtInterRegular35),
                        ),
                        Padding(
                          padding: scale.getPadding(left: 20, top: 15),
                          child: Row(
                            children: [
                              Image.network(
                                state.eventDetailsModelObj?.homeItemModel?.organiserIcon ?? '',
                                height: scale.getScaledHeight(51),
                                width: scale.getScaledWidth(54),
                                alignment: Alignment.center,
                                fit: BoxFit.cover,
                                loadingBuilder: (context, child, loadingProgress) {
                                  if (loadingProgress == null) return child;
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                },
                                errorBuilder: (context, error, stackTrace) {
                                  return CustomImageView(
                                    imagePath: 'assets/images/image_not_found.png',
                                    height: scale.getScaledHeight(
                                      51,
                                    ),
                                    width: scale.getScaledWidth(
                                      54,
                                    ),
                                    radius: BorderRadius.circular(
                                      scale.getScaledHeight(
                                        10,
                                      ),
                                    ),
                                    alignment: Alignment.center,
                                  );
                                },
                              ),
                              Padding(
                                padding: scale.getPadding(left: 8, top: 8, bottom: 4),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(state.eventDetailsModelObj?.homeItemModel?.organiserName ?? '',
                                        overflow: TextOverflow.ellipsis, textAlign: TextAlign.left, style: AppStyle.txtInterRegular15),
                                    Padding(
                                      padding: scale.getPadding(top: 5),
                                      child: Text("Organizer",
                                          overflow: TextOverflow.ellipsis, textAlign: TextAlign.left, style: AppStyle.txtInterRegular12),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: scale.getPadding(left: 23, top: 27),
                          child: Row(
                            children: [
                              CustomIconButton(height: 48, width: 48, child: CustomImageView(svgPath: 'assets/images/img_calendar.svg')),
                              Padding(
                                padding: scale.getPadding(left: 14, top: 3),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                        DateFormat('dd MMMM, yyyy').format(
                                          DateTime.parse(state.eventDetailsModelObj?.homeItemModel?.dateTime ?? ''),
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle.txtInterMedium18Gray900),
                                    Padding(
                                      padding: scale.getPadding(top: 8),
                                      child: Text(
                                          DateFormat('EEEE, h:mm a').format(
                                            DateTime.parse(state.eventDetailsModelObj?.homeItemModel?.dateTime ?? ''),
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle.txtInterRegular12Gray600),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: scale.getPadding(left: 23, top: 24),
                          child: Row(
                            children: [
                              CustomIconButton(
                                height: 48,
                                width: 48,
                                variant: IconButtonVariant.FillIndigoA20063,
                                child: CustomImageView(svgPath: 'assets/images/img_location.svg'),
                              ),
                              Padding(
                                padding: scale.getPadding(left: 14, top: 2),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text('${state.eventDetailsModelObj?.homeItemModel?.venueName ?? ''}',
                                        overflow: TextOverflow.ellipsis, textAlign: TextAlign.left, style: AppStyle.txtInterMedium18Gray900),
                                    Padding(
                                      padding: scale.getPadding(top: 10),
                                      child: Text(
                                          '${state.eventDetailsModelObj?.homeItemModel?.venueCity ?? ''}, ${state.eventDetailsModelObj?.homeItemModel?.venueCountry ?? ''}',
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle.txtInterRegular12Gray600),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: scale.getScaledHeight(236),
                          width: double.maxFinite,
                          margin: scale.getMargin(top: 39),
                          child: Stack(
                            alignment: Alignment.topCenter,
                            children: [
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  height: scale.getScaledHeight(92),
                                  width: double.maxFinite,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment(0.5, 0),
                                      end: Alignment(0.5, 1),
                                      colors: [ColorConstant.whiteA70000, ColorConstant.whiteA700],
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                  padding: scale.getPadding(left: 20, right: 24),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text("About Event",
                                          overflow: TextOverflow.ellipsis, textAlign: TextAlign.left, style: AppStyle.txtInterMedium18Gray900),
                                      Container(
                                        width: scale.getScaledWidth(330),
                                        margin: scale.getMargin(top: 15),
                                        child: Text(
                                          "${state.eventDetailsModelObj?.homeItemModel?.description ?? ''}",
                                          maxLines: 7,
                                          overflow: TextOverflow.ellipsis,
                                          style: AppStyle.txtInterRegular15.copyWith(color: ColorConstant.gray900),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  height: scale.getScaledHeight(181),
                                  width: double.maxFinite,
                                  margin: scale.getMargin(bottom: 2),
                                  padding: scale.getPadding(left: 52, top: 23, right: 52, bottom: 23),
                                  decoration: AppDecoration.gradientWhiteA70000WhiteA700,
                                  child: Stack(
                                    alignment: Alignment.bottomCenter,
                                    children: [
                                      Align(
                                        alignment: Alignment.bottomCenter,
                                        child: Card(
                                          clipBehavior: Clip.antiAlias,
                                          elevation: 0,
                                          margin: EdgeInsets.all(0),
                                          color: ColorConstant.indigoA200,
                                          shape: RoundedRectangleBorder(borderRadius: BorderRadiusStyle.roundedBorder16),
                                          child: Container(
                                            height: scale.getScaledHeight(58),
                                            width: scale.getScaledWidth(271),
                                            padding: scale.getPadding(all: 14),
                                            decoration: AppDecoration.outlineIndigo3003f.copyWith(borderRadius: BorderRadiusStyle.roundedBorder16),
                                            child: Stack(
                                              children: [
                                                CustomIconButton(
                                                  height: 30,
                                                  width: 30,
                                                  variant: IconButtonVariant.FillIndigoA400,
                                                  shape: IconButtonShape.CircleBorder15,
                                                  alignment: Alignment.centerRight,
                                                  child: CustomImageView(svgPath: 'assets/images/img_arrowright.svg'),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Align(
                                          alignment: Alignment.bottomCenter,
                                          child: Padding(
                                              padding: scale.getPadding(bottom: 20),
                                              child: Text("BOOK NOW".toUpperCase(),
                                                  overflow: TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: AppStyle.txtInterMedium16WhiteA700.copyWith(letterSpacing: scale.getScaledWidth(1.0)))))
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
