import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomSvgAssets extends StatelessWidget {
  final String? path;
  final ColorFilter? colorFilter;
  final BoxFit fit;
  final double? width;
  final double? height;

  const CustomSvgAssets({
    super.key,
    this.path,
    this.colorFilter,
    this.fit = BoxFit.scaleDown,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      path!,
      fit: BoxFit.scaleDown,
      colorFilter: colorFilter,
      height: height,
      width: width,
    );
  }
}
