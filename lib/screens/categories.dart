import 'package:flutter/material.dart'; // مكتبة flutter للمواد الأساسية
import '/constants/texts.dart'; // الملف الذي يحتوي على النصوص الثابتة مثل العنوان والأسماء
import '/constants/data.dart'; // الملف الذي يحتوي على البيانات الثابتة مثل الوصف والمكونات
import '/screens/page.dart'; // الملف الذي يحتوي على الشاشة الرئيسية
import '/widgets/navigation.dart'; // ملف الأدوات المساعدة للتنقل بين الصفحات
import '../widgets/appbar.dart'; // ملف الشريط العلوي للتطبيق
import '../widgets/recipes_body.dart'; // ملف يحتوي على عناصر الواجهة الأمامية للتطبيق مثل الوصفات والمكونات

//تم إنشاء فئة CategoriesPage التي ترث من StatelessWidget.

class CategoriesPage extends StatelessWidget {
// تم تعريف المتغيرات التالية:

  final List recipes; // قائمة بكافة الوصفات
  final clickFavorite; // دالة تسمح للمستخدمين بتعيين الوصفات كمفضلة
  final currentIndex; // الصفحة الحالية للشاشة
  final changeIndex; // دالة تغيير الصفحة الحالية للشاشة
  final fetchedData;

  const CategoriesPage({
    super.key,
    required this.clickFavorite,
    required this.recipes,
    required this.changeIndex,
    required this.currentIndex,
    required this.fetchedData,
  });

// تم إنشاء وظيفة build التي تنشئ وتعيد Scaffold.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title, // عنوان التطبيق
          style: TextStyle(
            color: Colors.black, // لون النص
          ),
        ),
        automaticallyImplyLeading: false,
        centerTitle: true, // النص في الوسط
      ),
      // واجهة الفئات
      body: (fetchedData == null || fetchedData == true)
          ? Align(
              alignment: Alignment.topRight,
              child: ListView.builder(
                // الحشو
                padding: EdgeInsets.symmetric(
                  vertical: 15,
                  horizontal: 10,
                ),
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  // واجهة الفءة
                  return CategoryItem(
                    data: recipes
                        .where((recipe) =>
                            recipe['category'] == categories[index]['name'])
                        .toList(),
                    index: index,
                    clickFavorite: clickFavorite,
                    currentIndex: currentIndex,
                    changeIndex: changeIndex,
                    category: categories[index]['name'],
                  );
                },
              ),
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
      // الشريط السفلي للتنقل بين الصفحات
      bottomNavigationBar: BottomNavigation(
        currentIndex: currentIndex,
        changeIndex: changeIndex,
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.data,
    required this.index,
    required this.clickFavorite,
    required this.currentIndex,
    required this.changeIndex,
    required this.category,
  });
  final category;
  final clickFavorite;
  final currentIndex;
  final changeIndex;
  final data;
  final index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Align(
                    alignment: Alignment.topRight,
                    child: Scaffold(
                      appBar: mainAppBar(data: data, leading: true),
                      body: RecipesBody(
                        recipes: data,
                        clickFavorite: clickFavorite,
                        second_title: '$second_title_category${category}',
                        pop_when_favorite: false,
                      ),
                      bottomNavigationBar: BottomNavigation(
                          currentIndex: currentIndex, changeIndex: changeIndex),
                    ),
                  ),
                ));
          },
          child: AspectRatio(
            aspectRatio: 16 / 7,
            child: Container(
              decoration: BoxDecoration(
                color: categories[index]['color'],
                borderRadius: BorderRadius.circular(10),
              ),
              alignment: Alignment.center,
              child: Text(
                categories[index]['name'],
                textAlign: TextAlign.center,
                textDirection: TextDirection.rtl,
                // الثيم الخاص بالنص
                style: Theme.of(context)
                    .textTheme
                    .displayMedium!
                    .copyWith(color: Colors.white),
              ),
            ),
          )),
    );
  }
}
