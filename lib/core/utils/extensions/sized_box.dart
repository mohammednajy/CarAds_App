//  What did you mean in your comment?
// I need discuss in this class when make a meet

import 'package:flutter/material.dart';
class ScreenUtil {
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  // Getter to access MediaQueryData when context is available
  static MediaQueryData get mediaQueryData {
    final context = navigatorKey.currentContext;
    if (context == null) {
      throw Exception("Navigator context is not available yet.");
    }
    return MediaQuery.of(context);
  }

  static double width(num value) => value * mediaQueryData.size.width / 100;
  static double height(num value) => value * mediaQueryData.size.height / 100;
}

extension FlutterSizes on num {
  //
  // static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  //
  // static final MediaQueryData mediaQueryData =
  //     MediaQuery.of(navigatorKey.currentState!.context);

  // static final double screenDeviceWidth = mediaQueryData.size.width;
  // static final double screenDeviceHeight = mediaQueryData.size.height;

  static const designWidth = 360;
  static const designHeight = 800;

  SizedBox get addHorizontalSpace {
    return SizedBox(
      width: width,
    );
  }

  SizedBox get addVerticalSpace {
    return SizedBox(
      height: ScreenUtil.height(this) * (toDouble() / ScreenUtil.height(this)),
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

  double get textSp {
    return ScreenUtil.width(this) * (toDouble() / designWidth);
  }

  double get borderRadius {
    return toDouble();
  }

  EdgeInsets get paddingAll {
    return EdgeInsets.all(toDouble());
  }

  EdgeInsets get paddingHorizontal {
    return EdgeInsets.symmetric(
        horizontal: ScreenUtil.width(this) * (toDouble() / designWidth));
  }

  EdgeInsets get paddingVertical {
    return EdgeInsets.symmetric(
        vertical: ScreenUtil.height(this) * (toDouble() / designHeight));
  }

  EdgeInsets get paddingTop {
    return EdgeInsets.only(
        top: ScreenUtil.height(this) * (toDouble() / designHeight));
  }

  EdgeInsets get paddingBottom {
    return EdgeInsets.only(
        bottom: ScreenUtil.height(this) * (toDouble() / designHeight));
  }

  EdgeInsets get paddingLeft {
    return EdgeInsets.only(
        left: ScreenUtil.width(this) * (toDouble() / designWidth));
  }

  EdgeInsets get paddingRight {
    return EdgeInsets.only(
        right: ScreenUtil.width(this) * (toDouble() / designWidth));
  }

  EdgeInsets get paddingFromLTRB {
    final value = toDouble();
    return EdgeInsets.fromLTRB(
      ScreenUtil.width(this) * (value / designWidth),
      ScreenUtil.height(this) * (value / designHeight),
      ScreenUtil.width(this) * (value / designWidth),
      ScreenUtil.height(this) * (value / designHeight),
    );
  }

  EdgeInsets get marginAll {
    return EdgeInsets.all(toDouble());
  }

  EdgeInsets get marginHorizontal {
    return EdgeInsets.symmetric(
        horizontal: ScreenUtil.width(this) * (toDouble() / designWidth));
  }

  EdgeInsets get marginVertical {
    return EdgeInsets.symmetric(
        vertical: ScreenUtil.height(this) * (toDouble() / designHeight));
  }

  EdgeInsets get marginTop {
    return EdgeInsets.only(
        top: ScreenUtil.height(this) * (toDouble() / designHeight));
  }

  EdgeInsets get marginBottom {
    return EdgeInsets.only(
        bottom: ScreenUtil.height(this) * (toDouble() / designHeight));
  }

  EdgeInsets get marginLeft {
    return EdgeInsets.only(
        left: ScreenUtil.width(this) * (toDouble() / designWidth));
  }

  EdgeInsets get marginRight {
    return EdgeInsets.only(
        right: ScreenUtil.width(this) * (toDouble() / designWidth));
  }

  EdgeInsets get marginFromLTRB {
    final value = toDouble();
    return EdgeInsets.fromLTRB(
      ScreenUtil.width(this) * (value / designWidth),
      ScreenUtil.height(this) * (value / designHeight),
      ScreenUtil.width(this) * (value / designWidth),
      ScreenUtil.height(this) * (value / designHeight),
    );
  }

  BorderRadius get circularRadius {
    return BorderRadius.circular(toDouble());
  }
}
