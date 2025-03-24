import 'package:recipe_finder/data/models/recipe_model.dart';

class RecipeEntity {
  final int id;
  final String imageUrl;
  final String name;
  final int cookTime;
  final String ingredients;
  final String instructions;
  final bool isFavorite;

  RecipeEntity({
    required this.id,
    required this.imageUrl,
    required this.name,
    required this.cookTime,
    required this.ingredients,
    required this.instructions,
    required this.isFavorite,
  });

  factory RecipeEntity.fromModel(RecipeModel model) {
    return RecipeEntity(
      id: model.id,
      imageUrl: model.imageUrl,
      name: model.name,
      cookTime: model.cookTime,
      ingredients: model.ingredients,
      instructions: model.instructions,
      isFavorite: model.isFavorite,
    );
  }

  RecipeModel toModel() {
    return RecipeModel(
      id: id,
      imageUrl: imageUrl,
      name: name,
      cookTime: cookTime,
      ingredients: ingredients,
      instructions: instructions,
      isFavorite: isFavorite,
    );
  }

  RecipeEntity copyWith({
    int? id,
    String? imageUrl,
    String? name,
    int? cookTime,
    String? ingredients,
    String? instructions,
    bool? isFavorite,
  }) {
    return RecipeEntity(
      id: id ?? this.id,
      imageUrl: imageUrl ?? this.imageUrl,
      name: name ?? this.name,
      cookTime: cookTime ?? this.cookTime,
      ingredients: ingredients ?? this.ingredients,
      instructions: instructions ?? this.instructions,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}
