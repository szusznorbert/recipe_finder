import 'package:flutter/material.dart';
import 'package:recipe_finder/presentation/screens/home/home_screen.dart';
import 'package:recipe_finder/presentation/common/navigation/route_item.dart';
import 'package:recipe_finder/presentation/screens/recipe_details/receipe_details_screen.dart';
import 'package:recipe_finder/domain/entities/recipe_entity.dart';

typedef RecipeDetailsPageBuilder = Widget Function(RecipeEntity recipe);

class Routes {
  static final RouteItem home = RouteItem(path: '/', name: 'home', pageBuilder: (_) => HomeScreen());

  static final RouteItem recipeDetails = RouteItem(
    path: '/recipe_details',
    name: 'recipe_details',
    pageBuilder: (recipeId) => RecipeDetails(recipeId: recipeId),
  );
}
