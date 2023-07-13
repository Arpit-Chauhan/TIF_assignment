import '../../../utils/app_decoration.dart';
import '../../../utils/app_style.dart';
import '../../../utils/color_constants.dart';
import '../../../utils/scaling.dart';
import '../../../utils/widgets/custom_image_view.dart';
import '../models/home_item_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class HomeItemWidget extends StatelessWidget {
  HomeItemWidget(
    this.homeItemModelObj, {
    Key? key,
    this.onTapRadio,
  }) : super(
          key: key,
        );

  HomeItemModel homeItemModelObj;

  Function(String)? onTapRadio;

  @override
  Widget build(BuildContext context) {
    ScalingUtility scale = ScalingUtility(context: context)..setCurrentDeviceSize();
    return Container(
      padding: scale.getPadding(
        top: 7,
        bottom: 7,
      ),
      decoration: AppDecoration.outlineBluegray6000f.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder16,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Card(
            clipBehavior: Clip.antiAlias,
            elevation: 0,
            margin: EdgeInsets.all(0),
            color: ColorConstant.orange200,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusStyle.roundedBorder10,
            ),
            child: Container(
              height: scale.getScaledHeight(
                107,
              ),
              width: scale.getScaledWidth(
                89,
              ),
              decoration: AppDecoration.fillWhiteA700.copyWith(
                borderRadius: BorderRadiusStyle.roundedBorder10,
              ),
              child: Image.network(
                homeItemModelObj.bannerImage ?? '',
                height: scale.getScaledHeight(
                  107,
                ),
                width: scale.getScaledWidth(
                  79,
                ),
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
                      92,
                    ),
                    width: scale.getScaledWidth(
                      79,
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
            ),
          ),
          Padding(
            padding: scale.getPadding(
              top: 5,
              bottom: 4,
              left: 3
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  DateFormat('E, MMM d • h:mm a').format(DateTime.parse(homeItemModelObj.dateTime ?? ''),),
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtInterRegular13,
                ),
                Container(
                  width: scale.getScaledWidth(
                    149,
                  ),
                  margin: scale.getMargin(
                    top: 2,
                  ),
                  child: Text(
                    homeItemModelObj.description ?? '',
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtInterMedium15,
                  ),
                ),
                Padding(
                  padding: scale.getPadding(
                    top: 12,
                  ),
                  child: Row(
                    children: [
                      CustomImageView(
                        svgPath: 'assets/images/img_group6.svg',
                        height: scale.getScaledHeight(
                          14,
                        ),
                        width: scale.getScaledWidth(
                          14,
                        ),
                        alignment: Alignment.center,
                      ),
                      Padding(
                        padding: scale.getPadding(left: 3),
                        child: Container(
                          width: scale.getScaledWidth(180),
                          child: Text(
                            '${homeItemModelObj.venueName??''} • ${homeItemModelObj.venueCity??''}, ${homeItemModelObj.venueCountry??''}',
                            overflow: TextOverflow.fade,
                            style: AppStyle.txtInterRegular13.copyWith(color: ColorConstant.gray600),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
