import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_finder/domain/providers/title_provider.dart';
import 'package:recipe_finder/presentation/common/design/font_sizes.dart';

class TitleText extends ConsumerWidget {
  const TitleText({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final title = ref.watch(titleProvider);
    return Text(title, style: TextStyle(fontSize: FontSizes.title, fontWeight: FontWeight.bold));
  }
}
