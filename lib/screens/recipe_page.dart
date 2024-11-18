import 'package:flutter/material.dart';
import '/constants/texts.dart';

import '../constants/data.dart';
import '../widgets/recipe_page/recipe_details.dart';
import '../widgets/recipe_page/top_recipe.dart';

class RecipePageView extends StatefulWidget {
  final recipes;
  final index;
  final clickFavorite;
  final pop_when_favorite;

  const RecipePageView({
    super.key,
    required this.recipes,
    required this.index,
    required this.clickFavorite,
    this.pop_when_favorite = false,
  });

  @override
  State<RecipePageView> createState() => _RecipePageViewState();
}

class _RecipePageViewState extends State<RecipePageView> {
  late PageController _pageController;
  @override
  void initState() {
    _pageController = PageController(initialPage: widget.index);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: PageView.builder(
          controller: _pageController,
          physics: ClampingScrollPhysics(),
          itemCount: widget.recipes.length,
          itemBuilder: (context, index) {
            return RecipeDetailPage(
              recipe: widget.recipes[index],
              pop_when_favorite: widget.pop_when_favorite,
              clickFavorite: widget.clickFavorite,
            );
          },
        ),
      ),
    );
  }
}

class RecipeDetailPage extends StatelessWidget {
  final Map recipe;
  final clickFavorite;
  final pop_when_favorite;

  RecipeDetailPage({
    required this.recipe,
    required this.clickFavorite,
    this.pop_when_favorite = false,
  });

  @override
  Widget build(BuildContext context) {
    bool fav = recipe['favorite'] == true;
    return Scaffold(
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: CustomScrollView(
          
          slivers: [
            TopRecipePage(recipe: recipe),
            RecipeDetails(
              recipe: recipe,
              clickFavorite: clickFavorite,
              pop_when_favorite: pop_when_favorite,
              fav: fav,
            ),
          ],
        ),
      ),
    );
  }
}
