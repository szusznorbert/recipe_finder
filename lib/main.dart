import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:recipe_finder/core/consts.dart';
import 'package:recipe_finder/data/models/recipe_model.dart';
import 'package:recipe_finder/presentation/common/navigation/router.dart';

import 'data/adapters/recipe_model_adapter.dart';
import 'presentation/common/design/theme_colorscheme.dart';

void main() async {
  apiKey = const String.fromEnvironment('API_KEY');
  await Hive.initFlutter();
  Hive.registerAdapter(RecipeModelAdapter());
  await Hive.openBox<RecipeModel>('favorites');
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: appTitle,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorScheme: ThemeColorScheme.lightColorScheme, fontFamily: 'Outfit'),
      darkTheme: ThemeData(colorScheme: ThemeColorScheme.darkColorScheme),
      routerConfig: router,
    );
  }
}
