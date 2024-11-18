import 'package:flutter/material.dart';

import '../screens/recipe_page.dart';

class RecipesBody extends StatelessWidget {
  final recipes;
  final clickFavorite;
  final pop_when_favorite;
  final second_title;
  const RecipesBody({
    super.key,
    required this.recipes,
    required this.clickFavorite,
    required this.second_title,
    this.pop_when_favorite = false,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: EdgeInsets.all(15),
          child: Text(
            second_title,
            style: Theme.of(context).textTheme.displayMedium,
            textDirection: TextDirection.rtl,
          ),
        ),
        for (int index = 0; index < recipes.length; index++)
          Directionality(
            textDirection: TextDirection.rtl,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => RecipePageView(
                    recipes: recipes,
                    index: index,
                    clickFavorite: clickFavorite,
                    pop_when_favorite: pop_when_favorite,
                  ),
                ));
              },
              child: Container(
                // hgpa,
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // الصورة
                    AspectRatio(
                      aspectRatio: 16 / 7,
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 1),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: ClipRRect(
                          // تدوير الحواف
                          borderRadius: BorderRadius.circular(16),
                          // إذا كانت الصورة تأتي من راط فسيتم استيرادها منها و أيضا في حالة كانت من مسار
                          child: recipes[index]['imageUrl']
                                  .toString()
                                  .startsWith('http')
                              ? Image.network(
                                  recipes[index]['imageUrl'],
                                  fit: BoxFit.cover,
                                )
                              : Image.asset(
                                  recipes[index]['imageUrl'],
                                  fit: BoxFit.cover,
                                ),
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    // النص الخاص باسم الطبق
                    Text(
                      recipes[index]['name'],
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                    // التص الخاص بعدد المكونات
                    Text(
                      '${recipes[index]["ingredients"].length} مكونات',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
            ),
          )
      ],
    );
  }
}
