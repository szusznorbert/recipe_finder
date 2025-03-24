import 'package:hive/hive.dart';
import 'package:recipe_finder/data/models/recipe_model.dart';

class RecipeLocalStorage {
  List<RecipeModel> getRecipes() {
    final favoritesBox = Hive.box<RecipeModel>('favorites');
    return favoritesBox.values.toList();
  }

  Future<void> saveRecipe(RecipeModel recipe) async {
    final favoritesBox = Hive.box<RecipeModel>('favorites');
    final existingIndex = favoritesBox.values.toList().indexWhere((storedRecipe) => storedRecipe.id == recipe.id);

    if (existingIndex == -1) {
      await favoritesBox.add(recipe);
    }
  }

  Future<void> removeRecipe(int id) async {
    final favoritesBox = Hive.box<RecipeModel>('favorites');
    final index = favoritesBox.values.toList().indexWhere((recipe) => recipe.id == id);

    if (index != -1) {
      await favoritesBox.deleteAt(index);
    }
  }
}
