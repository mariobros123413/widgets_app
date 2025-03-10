import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/router/router_config.dart';
import 'package:widgets_app/config/theme/app_theme.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

void main() {
  runApp(
    const ProviderScope(child: MainApp()),
  );
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final bool isDarkmode = ref.watch(isDarkmodeProvider);
    // final int selectedColor = ref.watch(selectedColorProvider);
    final AppTheme appTheme = ref.watch(themeNotifierProvider);
    return MaterialApp.router(
      title: 'Widgets App',
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      // theme: AppTheme(selectedColor: selectedColor, isDarkmode: isDarkmode)
      //     .getTheme(),
      theme: appTheme.getTheme(),
      // routes: { // PARTE DE LA OPCION 2
      //   '/buttons': (context) => const ButtonsScreen(),
      //   '/cards': (context) => const CardsScreen(),
      // },
    );
  }
}
