import 'package:car_ads_app/core/commonWidgets/bottom_sheet_widget.dart';
import 'package:car_ads_app/core/commonWidgets/custom_svg.dart';
import 'package:car_ads_app/core/config/utils/extensions/text_style_extension.dart';
import 'package:car_ads_app/core/config/utils/resources/colors_manger.dart';
import 'package:car_ads_app/core/config/utils/resources/icons_path.dart';
import 'package:car_ads_app/core/config/utils/resources/sizes_in_app.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PayWayCardWidget extends StatelessWidget {
  const PayWayCardWidget({
    super.key,
    required this.disKey,
    required this.paymentMethodeImage,
    required this.subTitle,
    required this.title,
  });

  final Key disKey;
  final String paymentMethodeImage;
  final String title;

  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: disKey,
      background: Row(
        spacing: 16,
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            onTap: () {
              if (kDebugMode) {
                print('Ahed Click of Edit');
              }
            },
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppSize.borderRadius),
                  color: ColorManager.primary10),
              child: const CustomSvgAssets(
                path: IconsPath.pensel,
              ),
            ),
          ),
          InkWell(
            onTap: () {
              showModalBottomSheet(
                  context: context,
                  builder: (context) => BottomSheetWidget(
                    title: 'Delete Your Card',
                    body: const Text(
                        'Do you confirm that you want to delete this card, as this action cannot be reversed?'),
                    primaryButtonText: 'YES , DELETE IT ',
                    secondaryButtonText: 'NO , I CHANGED MY MIND !',
                    onPressedButton: () {},
                    onPressedTextButton: () {},
                  ));
            },
            child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(AppSize.borderRadius),
                    color: ColorManager.warning10),
                child: const CustomSvgAssets(
                  path: IconsPath.delete,
                )),
          ),
        ],
      ),
      confirmDismiss: (direction) => stopDismissible(),
      movementDuration: const Duration(seconds: 6),
      // confirmDismiss: (direction) => showDialog(
      //   context: context,
      //   builder: (context) => AlertDialog(
      //     title: const Text('Are you sure?'),
      //     content: const Text('Do you want to remove item from the cart'),
      //     actions: [
      //       TextButton(
      //           onPressed: () => Navigator.of(context).pop(false),
      //           child: const Text('No')),
      //       TextButton(
      //           onPressed: () => Navigator.of(context).pop(true),
      //           child: const Text('Yes'))
      //     ],
      //   ),
      // ),
      // onDismissed: (DismissDirection direction) {
      //   // Your action when item is dismissed goes here
      //
      // },
      // onResize: () {
      //   // Your resize animation logic goes here (optional)
      // },
      direction: DismissDirection.endToStart,
      child: ListTile(
        tileColor: ColorManager.backGroundColor,
        contentPadding:
        const EdgeInsetsDirectional.symmetric(vertical: 8, horizontal: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.borderRadius),
        ),
        leading: CustomSvgAssets(path: paymentMethodeImage),
        title: Text(title, style: context.bodyMedium),
        subtitle: Text(subTitle, style: context.labelSmall),
      ),
    );
  }

  Future<bool> stopDismissible() async => false;
}