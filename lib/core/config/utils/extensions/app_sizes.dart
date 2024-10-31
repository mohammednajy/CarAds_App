import 'package:flutter/material.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

extension AppSizes on num {
  static final Size mediaQueryData =
      MediaQuery.sizeOf(navigatorKey.currentState!.context);
  static final double screenDeviceWidth = mediaQueryData.width;
  static final double screenDeviceHeight = mediaQueryData.height;
  static const designWidth = 360;
  static const designHeight = 800;

  SizedBox get addHorizontalSpace {
    return SizedBox(
      width: width,
    );
  }

  SizedBox get addVerticalSpace {
    return SizedBox(
      height: screenDeviceHeight * (toDouble() / designHeight),
    );
  }

  double get dp {
    return toDouble();
  }

  double get width {
    return screenDeviceWidth * (toDouble() / designWidth);
  }

  double get height {
    return screenDeviceHeight * (toDouble() / designHeight);
  }

  EdgeInsets get spaceAroundAll {
    return EdgeInsets.all(toDouble());
  }

  EdgeInsets get spaceHorizontal {
    return EdgeInsets.symmetric(
        horizontal: screenDeviceWidth * (toDouble() / designWidth));
  }

  EdgeInsets get spaceVertical {
    return EdgeInsets.symmetric(
        vertical: screenDeviceHeight * (toDouble() / designHeight));
  }

  EdgeInsetsDirectional get spaceTop {
    return EdgeInsetsDirectional.only(
        top: screenDeviceHeight * (toDouble() / designHeight));
  }

  EdgeInsetsDirectional get spaceBottom {
    return EdgeInsetsDirectional.only(
        bottom: screenDeviceHeight * (toDouble() / designHeight));
  }

  EdgeInsetsDirectional get spaceStart {
    return EdgeInsetsDirectional.only(
        start: screenDeviceWidth * (toDouble() / designWidth));
  }

  EdgeInsetsDirectional get spaceEnd {
    return EdgeInsetsDirectional.only(
        end: screenDeviceWidth * (toDouble() / designWidth));
  }

  BorderRadius get circularRadius {
    return BorderRadius.circular(toDouble());
  }
}
