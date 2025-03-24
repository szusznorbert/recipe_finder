import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_finder/domain/providers/recipe_provider.dart';
import 'package:recipe_finder/presentation/common/design/spacing_sizes.dart';
import 'package:recipe_finder/presentation/common/design/font_sizes.dart';
import 'package:recipe_finder/presentation/common/design/icon_sizes.dart';
import 'package:recipe_finder/presentation/screens/common/favorite_button.dart';

class RecipeDetails extends ConsumerWidget {
  final int recipeId;
  const RecipeDetails({super.key, required this.recipeId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recipe = ref.watch(recipeProvider).value!.firstWhere((element) => element.id == recipeId);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Image.network(recipe.imageUrl, width: double.infinity, height: 300, fit: BoxFit.cover),
                Positioned(
                  top: SpacingSizes.large,
                  child: IconButton(
                    onPressed: () => context.pop(),
                    icon: Icon(Icons.arrow_back, color: Colors.black, size: IconSizes.large),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: SpacingSizes.medium, horizontal: SpacingSizes.medium),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(recipe.name, style: TextStyle(fontSize: FontSizes.large, fontWeight: FontWeight.bold)),
                            Text('${recipe.cookTime} minutes.', style: TextStyle(fontSize: FontSizes.small)),
                          ],
                        ),
                      ),
                      FavoriteButton(recipe: recipe),
                    ],
                  ),
                  SizedBox(height: SpacingSizes.medium),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Ingredients:', style: TextStyle(fontSize: FontSizes.medium, fontWeight: FontWeight.bold)),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: SpacingSizes.small),
                      child: Text(recipe.ingredients, style: TextStyle(fontSize: FontSizes.medium)),
                    ),
                  ),
                  SizedBox(height: SpacingSizes.medium),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Instructions:', style: TextStyle(fontSize: FontSizes.medium, fontWeight: FontWeight.bold)),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: SpacingSizes.small),
                      child: Text(recipe.instructions, style: TextStyle(fontSize: FontSizes.medium)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
