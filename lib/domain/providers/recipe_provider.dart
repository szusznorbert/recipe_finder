import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_finder/core/di/repositories.dart';
import 'package:recipe_finder/domain/entities/recipe_entity.dart';
import 'package:recipe_finder/domain/repositories/recipe_repository.dart';

class RecipeProvider extends AsyncNotifier<List<RecipeEntity>> {
  final RecipeRepository _recipeRepository;

  RecipeProvider({required RecipeRepository recipeRepository}) : _recipeRepository = recipeRepository;

  @override
  Future<List<RecipeEntity>> build() async {
    return getFavoriteRecipes();
  }

  Future<List<RecipeEntity>> getFavoriteRecipes() async {
    try {
      final recipes = await _recipeRepository.retrieveFavoriteRecipes();
      state = AsyncValue.data(recipes);
      return recipes;
    } catch (e) {
      return [];
    }
  }

  Future<void> setFavoriteRecipe(RecipeEntity recipe) async {
    try {
      final newState = [...state.value!.map((e) => e.id == recipe.id ? recipe.copyWith(isFavorite: true) : e)];
      await _recipeRepository.setFavoriteRecipe(recipe.copyWith(isFavorite: true));
      state = AsyncValue.data(newState);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  Future<void> removeFavoriteRecipe(RecipeEntity recipe) async {
    try {
      final newState = [...state.value!.map((e) => e.id == recipe.id ? recipe.copyWith(isFavorite: false) : e)];
      await _recipeRepository.removeFavoriteRecipe(recipe);
      state = AsyncValue.data(newState);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  Future<void> fetchRecipesByFoodDescription(String foodDescription) async {
    try {
      state = const AsyncValue.loading();
      final recipes = await _recipeRepository.fetchRecipesByFoodDescription(foodDescription);
      state = AsyncValue.data(recipes);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  Future<void> fetchOtherRecipes() async {
    try {
      state = const AsyncValue.loading();
      final recipes = await _recipeRepository.fetchOtherRecipes();
      state = AsyncValue.data(recipes);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }
}

final recipeProvider = AsyncNotifierProvider<RecipeProvider, List<RecipeEntity>>(() => RecipeProvider(recipeRepository: recipeRepository));
