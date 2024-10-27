import 'package:easy_localization/easy_localization.dart';

extension StringCasingExtension on String {
  String toCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';

  String toTitleCase() => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.toCapitalized())
      .join(' ');

  String? convertToTime() {
    DateTime dateFormat = DateTime.parse(this);
    return DateFormat.jm().format(dateFormat);
  }

  String? convertToDate() {
    DateTime dateFormat = DateTime.parse(this);
    return DateFormat.MMMd().format(dateFormat);
  }

  String? convertToFullDate() {
    DateTime dateFormat = DateTime.parse(this);
    return DateFormat.yMMMd().format(dateFormat);
  }

  String cardSyntaxToFullDate() {
    DateTime dateTime = DateFormat("MM/yy").parse(this);
    String fullMonthYear = DateFormat.yMMMM("en_US").format(dateTime);
    return fullMonthYear;
  }
}
