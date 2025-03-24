import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_finder/domain/providers/recipe_provider.dart';
import 'package:recipe_finder/domain/providers/visibility_provider.dart';
import 'package:recipe_finder/presentation/common/design/font_sizes.dart';

class MainButton extends ConsumerWidget {
  const MainButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    return Visibility(
      visible: ref.watch(visibilityProvider),
      child: Center(
        child: SizedBox(
          height: 50,
          child: ElevatedButton(
            onPressed: () {
              ref.read(recipeProvider.notifier).fetchOtherRecipes();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: colorScheme.primary,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8), side: BorderSide(color: colorScheme.secondary)),
              elevation: 0,
              shadowColor: Colors.transparent,
              splashFactory: NoSplash.splashFactory,
            ),
            child: Text(
              'I don\'t like this',
              style: TextStyle(color: colorScheme.onPrimary, fontWeight: FontWeight.bold, fontSize: FontSizes.medium),
            ),
          ),
        ),
      ),
    );
  }
}
