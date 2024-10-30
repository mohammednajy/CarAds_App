import 'package:flutter/material.dart';

class ScreenUtil {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static Size get mediaQueryData {
    final context = navigatorKey.currentContext;
    if (context == null) {
      throw Exception("Navigator context is not available yet.");
    }
    return MediaQuery.sizeOf(context);
  }

  static double width(num value) => value * mediaQueryData.width / 100;

  static double height(num value) => value * mediaQueryData.height / 100;
}

extension FlutterSizes on num {
  static const designWidth = 390;
  static const designHeight = 844;

  SizedBox get addHorizontalSpace {
    return SizedBox(
      width: width,
    );
  }

  SizedBox get addVerticalSpace {
    return SizedBox(
      height: ScreenUtil.height(this) * (toDouble() / designHeight),
    );
  }

  double get dp {
    return toDouble();
  }

  double get width {
    return ScreenUtil.width(this) * (toDouble() / designWidth);
  }

  double get height {
    return ScreenUtil.width(this) * (toDouble() / designHeight);
  }

  EdgeInsets get spaceAroundAll {
    return EdgeInsets.all(toDouble());
  }

  EdgeInsets get spaceHorizontal {
    return EdgeInsets.symmetric(
        horizontal: ScreenUtil.width(this) * (toDouble() / designWidth));
  }

  EdgeInsets get spaceVertical {
    return EdgeInsets.symmetric(
        vertical: ScreenUtil.height(this) * (toDouble() / designHeight));
  }

  EdgeInsetsDirectional get spaceTop {
    return EdgeInsetsDirectional.only(
        top: ScreenUtil.height(this) * (toDouble() / designHeight));
  }

  EdgeInsetsDirectional get spaceBottom {
    return EdgeInsetsDirectional.only(
        bottom: ScreenUtil.height(this) * (toDouble() / designHeight));
  }

  EdgeInsetsDirectional get spaceStart {
    return EdgeInsetsDirectional.only(
        start: ScreenUtil.width(this) * (toDouble() / designWidth));
  }

  EdgeInsetsDirectional get spaceEnd {
    return EdgeInsetsDirectional.only(
        end: ScreenUtil.width(this) * (toDouble() / designWidth));
  }

  BorderRadius get circularRadius {
    return BorderRadius.circular(toDouble());
  }
}
