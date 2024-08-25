import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

// Listaod de colores inmutable
final isDarkmodeProvider = StateProvider<bool>((ref) => false);

//Un simple boolean
final colorListProvider = StateProvider((ref) => colorList);

//Un simple int
final selectedColorProvider = StateProvider((ref) => 0);
