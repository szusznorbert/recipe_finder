import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_finder/domain/providers/recipe_provider.dart';
import 'package:recipe_finder/presentation/common/design/spacing_sizes.dart';
import 'package:recipe_finder/presentation/screens/home/widgets/recipe_card.dart';
import 'package:recipe_finder/presentation/screens/home/widgets/main_button.dart';

class RecipeList extends ConsumerWidget {
  const RecipeList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recipes = ref.watch(recipeProvider);
    return recipes.when(
      data:
          (recipes) => Column(
            children: [
              Expanded(
                child:
                    recipes.isEmpty
                        ? Text('No favorite recipes found')
                        : ListView.separated(
                          itemCount: recipes.length,
                          itemBuilder: (context, index) {
                            final recipe = recipes[index];
                            return RecipeCard(recipe: recipe);
                          },
                          separatorBuilder: (context, index) => const SizedBox(height: SpacingSizes.medium),
                        ),
              ),
              MainButton(),
            ],
          ),

      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stackTrace) => Center(child: Text('An error occurred $error')),
    );
  }
}
