import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_finder/domain/providers/recipe_provider.dart';
import 'package:recipe_finder/domain/providers/title_provider.dart';
import 'package:recipe_finder/domain/providers/visibility_provider.dart';
import 'package:recipe_finder/presentation/common/design/border_styles.dart';
import 'package:recipe_finder/presentation/common/design/font_sizes.dart';

class SearchInput extends ConsumerStatefulWidget {
  const SearchInput({super.key});

  @override
  ConsumerState<SearchInput> createState() => _SearchInputState();
}

class _SearchInputState extends ConsumerState<SearchInput> {
  late TextEditingController _localTextEditingController;

  @override
  void initState() {
    super.initState();
    _localTextEditingController = TextEditingController();
  }

  @override
  void dispose() {
    _localTextEditingController.dispose();
    super.dispose();
  }

  Widget _renderSuffixIcon(final color) {
    final List<Widget> icons = [];
    final searchIcon = Icon(Icons.search, color: Colors.black);
    final clearIcon = IconButton(
      onPressed:
          () => {
            ref.read(recipeProvider.notifier).getFavoriteRecipes(),
            ref.read(titleProvider.notifier).state = 'Favorites',
            ref.read(visibilityProvider.notifier).state = false,
            setState(() {
              _localTextEditingController.text = '';
            }),
          },
      icon: Icon(Icons.close, color: color),
    );

    if (_localTextEditingController.text.isNotEmpty) {
      icons.add(clearIcon);
      icons.remove(searchIcon);
    } else {
      icons.add(searchIcon);
      icons.remove(clearIcon);
    }

    return Row(mainAxisSize: MainAxisSize.min, children: icons);
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return TextField(
      controller: _localTextEditingController,
      style: TextStyle(fontSize: FontSizes.medium),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(left: 10, right: 10),
        hintText: 'What do you feel like eating?',
        hintStyle: TextStyle(fontSize: FontSizes.medium, color: colorScheme.tertiary),
        suffixIcon: _renderSuffixIcon(colorScheme.tertiary),
        border: BorderStyles.roundedBorder(colorScheme.tertiary),
        focusedBorder: BorderStyles.roundedBorder(colorScheme.tertiary),
        enabledBorder: BorderStyles.roundedBorder(colorScheme.tertiary),
      ),
      textInputAction: TextInputAction.search,
      onChanged: (value) {
        setState(() {});
      },
      onSubmitted: (value) {
        ref.read(titleProvider.notifier).state = 'Suggested Recipes';
        ref.read(recipeProvider.notifier).fetchRecipesByFoodDescription(value);
        ref.read(visibilityProvider.notifier).state = true;
      },
    );
  }
}
