import 'package:car_ads_app/core/config/utils/extensions/text_style_extension.dart';
import 'package:flutter/material.dart';

class HaveAccountSection extends StatelessWidget {
  final void Function() onTap;
  final String span1;
  final String span2;

  const HaveAccountSection({
    required this.onTap,
    required this.span1,
    required this.span2,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: InkWell(
        onTap: onTap,
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: span1,
                style: context.bodyMedium,
              ),
              TextSpan(
                text: span2,
                style: context.bodyMedium.copyWith(
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
