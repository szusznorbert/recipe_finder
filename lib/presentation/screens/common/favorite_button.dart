import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_finder/domain/entities/recipe_entity.dart';
import 'package:recipe_finder/domain/providers/recipe_provider.dart';

class FavoriteButton extends ConsumerWidget {
  final RecipeEntity recipe;
  const FavoriteButton({super.key, required this.recipe});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    if (recipe.isFavorite) {
      return IconButton(
        icon: Icon(Icons.favorite),
        onPressed: () {
          ref.read(recipeProvider.notifier).removeFavoriteRecipe(recipe);
        },
      );
    }
    return IconButton(
      icon: Icon(Icons.favorite_border, color: colorScheme.onSurface),
      onPressed: () {
        ref.read(recipeProvider.notifier).setFavoriteRecipe(recipe);
      },
    );
  }
}
