import 'package:flutter/material.dart';

import '../color_constants.dart';
import '../scaling.dart';

class CustomIconButton extends StatelessWidget {
  CustomIconButton({this.shape, this.padding, this.variant, this.alignment, this.margin, this.width, this.height, this.child, this.onTap});

  IconButtonShape? shape;

  IconButtonPadding? padding;

  IconButtonVariant? variant;

  Alignment? alignment;

  EdgeInsetsGeometry? margin;

  double? width;

  double? height;

  Widget? child;

  VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    ScalingUtility scale = ScalingUtility(context: context)..setCurrentDeviceSize();
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: _buildIconButtonWidget(),
          )
        : _buildIconButtonWidget();
  }

  _buildIconButtonWidget() {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: IconButton(
        visualDensity: VisualDensity(
          vertical: -4,
          horizontal: -4,
        ),
        iconSize: (height ?? 0),
        padding:EdgeInsets.all(0),
        icon: Container(
          alignment: Alignment.center,
          width: (width ?? 0),
          height: (height ?? 0),
          padding: _setPadding(),
          decoration: _buildDecoration(),
          child: child,
        ),
        onPressed: onTap,
      ),
    );
  }

  _buildDecoration() {
    return BoxDecoration(
      color: _setColor(),
      borderRadius: _setBorderRadius(),
    );
  }

  _setPadding() {
    switch (padding) {
      default:
        return EdgeInsets.all(9);
    }
  }

  _setColor() {
    switch (variant) {
      case IconButtonVariant.FillIndigoA20065:
        return ColorConstant.indigoA20065;
      case IconButtonVariant.FillIndigoA400:
        return ColorConstant.indigoA400;
      default:
        return ColorConstant.lightIndigo;
    }
  }

  _setBorderRadius() {
    switch (shape) {
      case IconButtonShape.CircleBorder15:
        return BorderRadius.circular(
            15.00,
        );
      default:
        return BorderRadius.circular(
            12.00,
        );
    }
  }
}

enum IconButtonShape {
  RoundedBorder12,
  CircleBorder15,
}

enum IconButtonPadding {
  PaddingAll9,
}

enum IconButtonVariant {
  FillIndigoA20063,
  FillIndigoA20065,
  FillIndigoA400,
}
