import 'package:flutter_riverpod/flutter_riverpod.dart';

final selectedLanguageProvider = StateProvider.autoDispose<String>((ref)=> 'en');
