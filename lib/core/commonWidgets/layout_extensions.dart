import 'package:flutter/material.dart';

extension LayoutExtensions on Widget {
  Widget pad([double value = 8.0]) => Padding(
        padding: EdgeInsets.all(value),
        child: this,
      );

  Widget center() => Center(child: this);
}
