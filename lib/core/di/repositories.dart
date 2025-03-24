import 'package:recipe_finder/core/di/remote_storages.dart';
import 'package:recipe_finder/domain/repositories/recipe_repository.dart';

import 'local_storages.dart';

final recipeRepository = RecipeRepository(recipeRemoteStorage: recipeRemoteStorage, recipeLocalStorage: recipeLocalStorage);
