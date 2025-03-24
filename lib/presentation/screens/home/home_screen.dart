import 'package:flutter/material.dart';
import 'package:recipe_finder/presentation/common/design/spacing_sizes.dart';
import 'package:recipe_finder/presentation/screens/home/widgets/recipe_list.dart';
import 'package:recipe_finder/presentation/screens/home/widgets/main_button.dart';
import 'package:recipe_finder/presentation/screens/home/widgets/search_input.dart';

import 'package:recipe_finder/presentation/screens/home/widgets/title_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(SpacingSizes.medium),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 20,
              children: [SearchInput(), TitleText(), Expanded(child: RecipeList())],
            ),
          ),
        ),
      ),
    );
  }
}
