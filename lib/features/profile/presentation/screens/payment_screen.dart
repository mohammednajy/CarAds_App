import 'package:car_ads_app/core/commonWidgets/custom_appbar.dart';
import 'package:car_ads_app/core/config/utils/extensions/text_style_extension.dart';
import 'package:car_ads_app/core/config/utils/resources/images_path.dart';
import 'package:car_ads_app/core/config/utils/resources/sizes_in_app.dart';
import 'package:car_ads_app/features/profile/presentation/widgets/pay_way_card_widget.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_floating_button.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: const CustomAppBar(title: 'Payment Methods'),
      body: Padding(
        padding: const EdgeInsetsDirectional.symmetric(
            horizontal: AppPadding.paddingHorizontal),
        child: Column(
          spacing: 16,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Manage your payment Methods', style: context.bodyMedium),
            PayWayCardWidget(
              disKey: UniqueKey(),
              paymentMethodeImage: ImagePath.paypal,
              title: '1234 **** **** ****',
              subTitle: 'Active ',
            ),
            PayWayCardWidget(
              disKey: UniqueKey(),
              paymentMethodeImage: ImagePath.paypal,
              title: '1234 **** **** ****',
              subTitle: 'Active ',
            ),
            PayWayCardWidget(
              disKey: UniqueKey(),
              paymentMethodeImage: ImagePath.paypal,
              title: '1234 **** **** ****',
              subTitle: 'Active ',
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CustomFloatingButton(
        buttonText: 'Add New Payment Methods',
        onPressed: () {},
      ),
    );
  }
}
