import 'package:intl/intl.dart';

import '../../../utils/app_decoration.dart';
import '../../../utils/app_style.dart';
import '../../../utils/color_constants.dart';
import '../../../utils/scaling.dart';
import '../../../utils/widgets/custom_image_view.dart';
import '../../home_screen/models/home_item_model.dart';
import 'package:flutter/material.dart';

class SearchItemWidget extends StatelessWidget {
  SearchItemWidget(
    this.searchItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  HomeItemModel searchItemModelObj;

  @override
  Widget build(BuildContext context) {
    ScalingUtility scale = ScalingUtility(context: context)..setCurrentDeviceSize();
    return Container(
      padding: scale.getPadding(
        all: 10,
      ),
      decoration: AppDecoration.outlineBluegray60011.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder16,
      ),
      child: Row(
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
                92,
              ),
              width: scale.getScaledWidth(
                79,
              ),
              decoration: AppDecoration.fillWhiteA700.copyWith(
                borderRadius: BorderRadiusStyle.roundedBorder10,
              ),
              child: Stack(
                children: [
                  Image.network(
                    searchItemModelObj.bannerImage ?? '',
                    height: scale.getScaledHeight(92),
                    width: scale.getScaledWidth(79),
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
                ],
              ),
            ),
          ),
          Padding(
            padding: scale.getPadding(
              left: 18,
              top: 12,
              bottom: 9,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  '${getNumberWithSuffix(DateTime.parse(searchItemModelObj?.dateTime ?? '').day).toUpperCase()} ${DateFormat.MMM().format(DateTime.parse(searchItemModelObj?.dateTime ?? '')).toUpperCase()}- ${DateFormat.E().format(DateTime.parse(searchItemModelObj?.dateTime ?? '')).toUpperCase()} -${DateFormat('h:mm a').format(DateTime.parse(searchItemModelObj?.dateTime ?? ''))}',
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtInterMedium12.copyWith(
                    fontWeight: FontWeight.w400,
                    letterSpacing: 1,
                  ),
                ),
                Container(
                  width: scale.getScaledWidth(
                    164,
                  ),
                  margin: scale.getMargin(
                    top: 4,
                  ),
                  child: Text(
                    searchItemModelObj?.description ?? '',
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtInterMedium18Gray900,
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

String getNumberWithSuffix(int number) {
  if (number >= 11 && number <= 13) {
    return '$number' + 'th';
  }
  switch (number % 10) {
    case 1:
      return '$number' + 'st';
    case 2:
      return '$number' + 'nd';
    case 3:
      return '$number' + 'rd';
    default:
      return '$number' + 'th';
  }
}
