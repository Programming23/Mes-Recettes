import 'package:flutter/material.dart';
import '/screens/search.dart';
import '../constants/data.dart';
import '../widgets/appbar.dart';
import '../widgets/navigation.dart';
import '../widgets/recipes_body.dart';

class MainPage extends StatelessWidget {
  final List recipes;
  final currentIndex;
  final changeIndex;
  final title;
  final second_title;
  final clickFavorite;
  final pop_when_favorite;
  final fecthedData;

  const MainPage({
    Key? key,
    required this.recipes,
    required this.changeIndex,
    required this.currentIndex,
    required this.second_title,
    required this.title,
    required this.clickFavorite,
    required this.fecthedData,
    this.pop_when_favorite = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Scaffold(
        // الشريط العلوي
        appBar: mainAppBar(data: recipes),
        // الواجهة الخاصة بعرض الوصفات
        body: (fecthedData == null || fecthedData == true)
            ? RecipesBody(
                recipes: recipes,
                clickFavorite: clickFavorite,
                pop_when_favorite: pop_when_favorite,
                second_title: second_title,
              )
            : Center(
                child: CircularProgressIndicator(),
              ),
        // الشريط السفليللتنقل
        bottomNavigationBar: BottomNavigation(
            currentIndex: currentIndex, changeIndex: changeIndex),
      ),
    );
  }
}
