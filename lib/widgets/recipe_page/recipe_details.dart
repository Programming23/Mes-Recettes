import 'package:flutter/material.dart';

import '../../constants/texts.dart';

class RecipeDetails extends StatelessWidget {
  const RecipeDetails({
    super.key,
    required this.recipe,
    required this.clickFavorite,
    required this.pop_when_favorite,
    required this.fav,
  });

  final Map recipe;
  final clickFavorite;
  final pop_when_favorite;
  final bool fav;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // اسم الطبق
            Center(
              child: Text(
                recipe['name'],
                style: Theme.of(context).textTheme.displayLarge,
              ),
            ),
            // مسافة بين الواجهات
            SizedBox(height: 10.0),
            Text(
              recipe['description'],
              style: TextStyle(
                fontSize: 15.0, // حجم الخط
              ),
            ),
            // عنوان المقادير
            Text(
              ingredients_title,
              style: TextStyle(
                fontWeight: FontWeight.bold, // وزن الخط
                fontSize: 20.0, // حجم الخط
              ),
            ),
            // مسافة بين الواجهات
            SizedBox(height: 8.0),
            for (var ingredient in recipe['ingredients'])
              Padding(
                padding: EdgeInsets.symmetric(vertical: 4.0),
                child: Text(
                  '- $ingredient',
                  style: TextStyle(
                    fontSize: 16.0, // حجم الخط
                  ),
                ),
              ),
            // مسافة بين الواجهات
            SizedBox(height: 16.0),
            Text(
              steps_title,
              style: TextStyle(
                fontWeight: FontWeight.bold, // وزن الخط
                fontSize: 20.0, // حجم الخط
              ),
            ),
            // مسافة بين الواجهات
            SizedBox(height: 8.0),
            // الواجهة الخاصة بخطوات الاعداد
            for (var i = 0; i < recipe['steps'].length; i++)
              Padding(
                padding: EdgeInsets.symmetric(vertical: 4.0), // الحشو
                // القائمة
                child: ListTile(
                  leading: CircleAvatar(
                    child: Text(
                      '${i + 1}', // رقم الخظوة
                      style: TextStyle(
                        fontSize: 16.0, // حجم الخط
                      ),
                    ),
                  ),
                  title: Text(
                    recipe['steps'][i], // محنوى نص الخطوة
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall, // الثيم الخاص بالنص
                  ),
                ),
              ),
            // مسافة بين الواجهات
            SizedBox(height: 16.0),
            // الواجهة الخاصة بمدة الطبخ
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // النص
                Text(
                  time_title, // محتوى النص
                  style: TextStyle(
                    fontWeight: FontWeight.bold, // وزن الخط
                    fontSize: 20.0, // حجم الخط
                  ),
                ),
                Text(
                  recipe['time'], // القيمة الخاصة ب مدة الطبخ
                  style: TextStyle(
                    fontSize: 16.0, // حجم الخط
                  ),
                ),
              ],
            ),
            // مسافة بين الواجهات
            SizedBox(height: 16.0),
            // واجهة زر المفضلة
            Center(
              child: ElevatedButton.icon(
                // دالة الضغط على زر المفضلة
                onPressed: () {
                  clickFavorite(recipe['index']);
                  if (pop_when_favorite) {
                    Navigator.pop(context);
                  }
                },
                icon: Icon(
                  Icons.favorite, // الايقونة
                  color:
                      fav ? Colors.pink.shade200 : Colors.white, // لون الايقونة
                ),
                label: Text(button_text_favorite), // نص الزر
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red, // لون الزر
                  padding: EdgeInsets.all(12), // حشو الزر
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
