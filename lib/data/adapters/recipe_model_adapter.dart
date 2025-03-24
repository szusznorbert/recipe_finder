import 'package:hive/hive.dart';
import 'package:recipe_finder/data/models/recipe_model.dart';

class RecipeModelAdapter extends TypeAdapter<RecipeModel> {
  @override
  final int typeId = 0;

  @override
  RecipeModel read(BinaryReader reader) {
    final id = reader.readInt();
    final imageUrl = reader.readString();
    final name = reader.readString();
    final cookTime = reader.readInt();
    final ingredients = reader.readString();
    final instructions = reader.readString();
    final isFavorite = reader.readBool();
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

  @override
  void write(BinaryWriter writer, RecipeModel obj) {
    writer.writeInt(obj.id);
    writer.writeString(obj.imageUrl);
    writer.writeString(obj.name);
    writer.writeInt(obj.cookTime);
    writer.writeString(obj.ingredients);
    writer.writeString(obj.instructions);
    writer.writeBool(obj.isFavorite);
  }
}
