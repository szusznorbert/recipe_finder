class RecipeModel {
  final int id;
  final String imageUrl;
  final String name;
  final int cookTime;
  final String ingredients;
  final String instructions;
  final bool isFavorite;

  RecipeModel({
    required this.id,
    required this.imageUrl,
    required this.name,
    required this.cookTime,
    required this.ingredients,
    required this.instructions,
    required this.isFavorite,
  });

  factory RecipeModel.fromJson(Map<String, dynamic> json) {
    return RecipeModel(
      id: DateTime.now().microsecondsSinceEpoch,
      imageUrl:
          'https://cdn.mindmegette.hu/2024/05/h8qWWLjrqm5E9gpL5mBiZXKdtXH7Rb9ojxCS9ox2mP8/fill/0/0/no/1/aHR0cHM6Ly9jbXNjZG4uYXBwLmNvbnRlbnQucHJpdmF0ZS9jb250ZW50L2YzM2UxOTkxOWM1MjQ5YjU4NTBkMGIyNTEyODhmZWQy.webp',
      name: json['name'],
      cookTime: json['cookTime'],
      ingredients: json['ingredients'],
      instructions: json['instructions'],
      isFavorite: false,
    );
  }
}
