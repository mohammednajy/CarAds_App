import 'package:car_ads_app/core/config/utils/resources/colors_manger.dart';
import 'package:car_ads_app/core/config/utils/resources/font_size.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    this.hintText,
    this.obscureText = false,
    required this.keyboardType,
    this.bottomMargin = 0,
    this.prefixIcon,
    this.suffix,
    this.suffixIcon,
    this.onChange,
    //this.onSaved,
    this.width = double.infinity,
    this.validator,
    this.controller,
    //this.autovalidateMode = AutovalidateMode.onUserInteraction,
    this.maxLines = 1,
    this.minLines = 1,
    this.readOnly = false,
    this.textInputAction,
    // this.backGroundColor = ColorManager.white,
    super.key,
  });

  final int maxLines;
  final int minLines;
  final String? hintText;
  final bool obscureText;
  final double bottomMargin;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final Function? onChange;
  final TextEditingController? controller;

  //AutovalidateMode? autovalidateMode;
  final Widget? prefixIcon;
  final Widget? suffix;
  final Widget? suffixIcon;
  final double width;
  final bool readOnly;
  final TextInputAction? textInputAction;

  // final Color? backGroundColor;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: textInputAction,
      readOnly: readOnly,
      //enableInteractiveSelection: true,
      maxLines: maxLines,
      minLines: minLines,
      style: const TextStyle(
        color: ColorManager.primaryTextColor,
        fontSize: FontSize.s14,
      ),
      onChanged: onChange as Function(String?)?,
      //   onSaved: onSaved as Function(String?)?,
      controller: controller,
      validator: validator,
      keyboardType: keyboardType,
      autovalidateMode: AutovalidateMode.disabled,
      obscureText: obscureText,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        suffix: suffix,
        prefixIcon: prefixIcon,
        hintText: hintText,
      ),
      //autofocus: true ,
    );
  }
}
