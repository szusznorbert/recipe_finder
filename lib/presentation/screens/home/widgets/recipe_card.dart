import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_finder/domain/entities/recipe_entity.dart';
import 'package:recipe_finder/presentation/common/design/font_sizes.dart';
import 'package:recipe_finder/presentation/common/navigation/routes.dart';
import 'package:recipe_finder/presentation/screens/common/favorite_button.dart';

class RecipeCard extends ConsumerWidget {
  final RecipeEntity recipe;

  const RecipeCard({super.key, required this.recipe});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        context.push('${Routes.recipeDetails.path}/${recipe.id}', extra: recipe.id);
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(color: Color(0xFFE1E1E1).withOpacity(0.2), offset: Offset(-4, 4), blurRadius: 8, spreadRadius: 0),
            BoxShadow(color: Color(0xFFE1E1E1).withOpacity(0.2), offset: Offset(4, -4), blurRadius: 8, spreadRadius: 0),
            BoxShadow(color: Colors.white.withOpacity(0.9), offset: Offset(-4, -4), blurRadius: 8, spreadRadius: 0),
            BoxShadow(color: Color(0xFFE1E1E1).withOpacity(0.9), offset: Offset(4, 4), blurRadius: 8, spreadRadius: 0),
          ],
        ),
        child: IntrinsicHeight(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(16), bottomLeft: Radius.circular(16)),
                child: FadeInImage.assetNetwork(
                  placeholder: 'assets/images/image_placeholder.png',
                  image: recipe.imageUrl,
                  width: 100,
                  height: 100,
                  fit: BoxFit.fill,
                  imageErrorBuilder: (context, error, stackTrace) {
                    return Container(color: Colors.grey[300], child: Icon(Icons.broken_image, color: Colors.grey[600]));
                  },
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 5),
                      Text(recipe.name, style: TextStyle(fontWeight: FontWeight.w600, fontSize: FontSizes.medium)),
                      SizedBox(height: 5),
                      Text('${recipe.cookTime} minutes.'),
                    ],
                  ),
                ),
              ),
              Center(child: FavoriteButton(recipe: recipe)),
            ],
          ),
        ),
      ),
    );
  }
}
