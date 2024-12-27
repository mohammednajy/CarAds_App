import 'package:hooks_riverpod/hooks_riverpod.dart';

final showCurrentPassProvider = StateProvider.autoDispose<bool>((ref) => true);
final showNewPassProvider = StateProvider.autoDispose<bool>((ref) => true);
final showConfirmPassProvider = StateProvider.autoDispose<bool>((ref) => true);
