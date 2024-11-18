// تم استيراد المكتبات المطلوبة
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

// تم استيراد الملفات المطلوبة
import 'constants/texts.dart';
import 'constants/data.dart';
import 'screens/about_us.dart';
import 'screens/loading_page.dart';
import 'screens/page.dart';
import '/constants/theme.dart';
import '/screens/categories.dart';
import '/screens/search.dart';

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // التأكد من تهيئة التطبيق بشكل صحيح
  SharedPreferences prefs = await SharedPreferences
      .getInstance(); // تم إنشاء متغير من نوع SharedPreferences لحفظ المفضلة
  runApp(MyApp(
    prefs: prefs,
  ));
}

class MyApp extends StatefulWidget {
  final prefs;
  MyApp({
    required this.prefs,
  });

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List recipes = []; // تم إنشاء قائمة الوصفات
  int currentIndex = 0; // تم إنشاء متغير لتحديد الصفحة الحالية
  Map favs = {}; // تم إنشاء متغير لحفظ المفضلة
  List favorites = []; // تم إنشاء قائمة المفضلة
  bool? fetchedData = null;

  @override
  void initState() {
    initStorage();

    // إذا أردت جلب الوصفات عن طريق API فيجب عليك العمل بهده الدالة و جعل السطر الخاص بدالة _getrecipesData تعليق
    // _fetchRecipes();
     _getRecipesData();

    super.initState();
  }

  // تم إنشاء دالة _getRecipesData لمعالجة بيانات الوصفات
  _getRecipesData() {
    setState(() {
      recipes = recipes_data; // تم استيراد المعلومات من ملف "data.dart"
    });

    initRecipesData();
  }

  changeCurrentIndex(new_index) {
    setState(() {
      currentIndex = new_index;
    });
  }

  // تم إنشاء دالة initStorage لتهيئة المفضلة
  void initStorage() async {
    try {
      favs = json.decode(widget.prefs.getString('favorites') as String)
          as Map; // تم قراءة المفضلة من الذاكرة المؤقتة وتحويلها إلى Map
    } catch (e) {
      widget.prefs.setString(
        'favorites',
        json.encode({}),
      );
    }
  }

  // تم إنشاء دالة _fetchrecipes لجلب الوصفات من API
  _fetchRecipes() async {
    setState(() {
      fetchedData = false;
    });
    final response = await http.get(Uri.parse('http://127.0.0.1:5000/'));
    if (response.statusCode == 200) {
      setState(() {
        recipes = List.from(json.decode(response
            .body)); // تم تحويل البيانات المجيبة إلى List وتخزينها في قائمة الوصفات
      });
    }

    initRecipesData();
    setState(() {
      fetchedData = true;
    });
  }

  initRecipesData() {
    for (int i = 0; i < recipes.length; i++) {
      recipes[i]['index'] = i;
      if (favs.containsKey(recipes[i]['id'].toString())) {
        setState(() {
          recipes[i]['favorite'] = true;
          favorites.add(recipes[i]);
        });
      } else {
        setState(() {
          recipes[i]['favorite'] = false;
        });
      }
    }
  }

  // هذا الدالة عندما يضغط المستخدم على زر المفضلة
  clickFavorite(index) {
    if (recipes[index]['favorite'] == true) {
      setState(() {
        favorites.remove(recipes[index]);
        favs.remove(recipes[index]['id'].toString());
        recipes[index]['favorite'] = false;
      });
    } else {
      setState(() {
        favorites.insert(0, recipes[index]);
        favs[recipes[index]['id'].toString()] = null;
        recipes[index]['favorite'] = true;
      });
    }
    widget.prefs.setString('favorites', json.encode(favs));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'recipes App',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (route) {
        // إعداد الراوتات للتنقل عبر الصفحات
        if (route.name == '/loading') {
          return MaterialPageRoute(builder: (context) => LoadingPage());
        } else if (route.name == '/') {
          return MaterialPageRoute(
            builder: (context) => MainPage(
              title: title,
              second_title: second_title_home,
              recipes: recipes,
              changeIndex: changeCurrentIndex,
              currentIndex: currentIndex,
              clickFavorite: clickFavorite,
              fecthedData: fetchedData,
            ),
          );
        } else if (route.name == '/search') {
          List recipes = route.arguments as List;
          return MaterialPageRoute(
              builder: (context) => SearchPage(
                    recipes: recipes,
                    clickFavorite: clickFavorite,
                  ));
        } else if (route.name == '/categories') {
          return MaterialPageRoute(
              builder: (context) => CategoriesPage(
                    fetchedData: fetchedData,
                    recipes: recipes,
                    clickFavorite: clickFavorite,
                    changeIndex: changeCurrentIndex,
                    currentIndex: currentIndex,
                  ));
        } else if (route.name == '/favorites') {
          return MaterialPageRoute(
              builder: (context) => MainPage(
                    title: title,
                    second_title: second_title_favorites,
                    recipes: favorites,
                    changeIndex: changeCurrentIndex,
                    currentIndex: currentIndex,
                    clickFavorite: clickFavorite,
                    fecthedData: fetchedData,
                    pop_when_favorite: true,
                  ));
        } else if (route.name == '/about_us') {
          return MaterialPageRoute(
              builder: (context) => AboutUs(
                    changeIndex: changeCurrentIndex,
                    currentIndex: currentIndex,
                  ));
        }
      },
      theme: theme,
      initialRoute: '/loading',
    );
  }
}
