import 'package:flutter/material.dart';

// How to use this?
// context.navigateTo(RoutesName.login);

extension NavigationExtension on BuildContext {
  // Navigate to a new screen with a route name
  Future navigateTo(String routeName, {Object? arguments}) {
    return Navigator.pushNamed(this, routeName, arguments: arguments);
  }

  // Replace the current screen with a new one
  Future navigateAndReplace(String routeName, {Object? arguments}) {
    return Navigator.pushReplacementNamed(this, routeName,
        arguments: arguments);
  }

  // Pop the current screen and return to the previous screen
  void goBack<T extends Object?>([T? result]) {
    Navigator.pop(this, result);
  }

  // Pop the current screen and return to the previous screen
  void canGoBack<T extends Object?>() {
    Navigator.canPop(this);
  }

  // Navigate and remove all previous screens until a specific route is reached
  Future navigateAndRemoveUntil(String routeName, RoutePredicate predicate,
      {Object? arguments}) {
    return Navigator.pushNamedAndRemoveUntil(this, routeName, predicate,
        arguments: arguments);
  }
}
