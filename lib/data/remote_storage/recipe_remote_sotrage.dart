import 'dart:convert';

import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:recipe_finder/core/consts.dart';
import 'package:recipe_finder/data/models/recipe_model.dart';

class RecipeRemoteStorage {
  int _attemptNumber = 1;
  String? _lastFoodDescription;

  Future<List<RecipeModel>> fetchRecipes(String foodDescription) async {
    _lastFoodDescription = foodDescription;
    _attemptNumber = 1;
    final model = GenerativeModel(model: 'gemini-1.5-flash-latest', apiKey: apiKey);

    final prompt =
        'Generate a JSON array containing at least 4 unique recipes based on a given food item: $foodDescription'
        ' This is attempt number $_attemptNumber, so provide different and creative recipes compared to previous attempts.'
        ' Each recipe should include the following fields:'
        'name: The name of the recipe.'
        'cookTime: An integer representing the cooking time in minutes.'
        'ingredients: A text list where each ingredient should be ordered with a bullet point (•)'
        'instructions: A very detailed text description of the steps required to prepare the recipe. The instructions should be ordered with numbers'
        'The response should be formatted as a valid JSON array.'
        '''''IMPORTANT:
    The response should be a valid JSON array only not map.
    Do NOT use triple backticks or any other formatting markers.
    Provide the JSON array directly without any explanation or additional text."''';

    final content = [Content.text(prompt)];
    final response = await model.generateContent(content);
    final text = response.text?.trim();

    final recipeMap = json.decode(text!);

    final List<RecipeModel> recipeList =
        recipeMap.map<RecipeModel>((recipe) {
          return RecipeModel.fromJson(recipe as Map<String, dynamic>);
        }).toList();

    return recipeList;
  }

  Future<List<RecipeModel>> fetchOtherRecipes() async {
    _attemptNumber++;
    return fetchRecipes(_lastFoodDescription ?? '');
  }
}
