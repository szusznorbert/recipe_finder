import 'package:recipe_finder/data/local_storage/recipe_local_storage.dart';
import 'package:recipe_finder/data/remote_storage/recipe_remote_sotrage.dart';
import 'package:recipe_finder/domain/entities/recipe_entity.dart';

class RecipeRepository {
  final RecipeRemoteStorage _recipeRemoteStorage;
  final RecipeLocalStorage _recipeLocalStorage;

  RecipeRepository({required RecipeRemoteStorage recipeRemoteStorage, required RecipeLocalStorage recipeLocalStorage})
    : _recipeRemoteStorage = recipeRemoteStorage,
      _recipeLocalStorage = recipeLocalStorage;

  Future<List<RecipeEntity>> retrieveFavoriteRecipes() async {
    final recipes = _recipeLocalStorage.getRecipes();
    return recipes.map((recipe) => RecipeEntity.fromModel(recipe)).toList();
  }

  Future<List<RecipeEntity>> fetchRecipesByFoodDescription(String foodDescription) async {
    final recipes = await _recipeRemoteStorage.fetchRecipes(foodDescription);

    return recipes.map((recipe) => RecipeEntity.fromModel(recipe)).toList();
  }

  Future<List<RecipeEntity>> fetchOtherRecipes() async {
    final recipes = await _recipeRemoteStorage.fetchOtherRecipes();

    return recipes.map((recipe) => RecipeEntity.fromModel(recipe)).toList();
  }

  Future<void> setFavoriteRecipe(RecipeEntity recipe) async {
    final recipeModel = recipe.toModel();
    await _recipeLocalStorage.saveRecipe(recipeModel);
  }

  Future<void> removeFavoriteRecipe(RecipeEntity recipe) async {
    await _recipeLocalStorage.removeRecipe(recipe.id);
  }
}
