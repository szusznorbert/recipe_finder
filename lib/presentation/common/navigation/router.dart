// GoRouter configuration
import 'package:go_router/go_router.dart';
import 'package:recipe_finder/presentation/common/navigation/routes.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(name: Routes.home.name, path: Routes.home.path, builder: (context, state) => Routes.home.page(null)),
    GoRoute(
      name: Routes.recipeDetails.name,
      path: '${Routes.recipeDetails.path}/:id',
      builder: (context, state) {
        final recipeId = state.extra as int;
        return Routes.recipeDetails.page(recipeId);
      },
    ),
  ],
);
