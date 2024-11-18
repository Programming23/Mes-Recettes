// ألوان واجهة الاقتباس
import 'package:flutter/material.dart';

// Theme

ThemeData theme = ThemeData(
  // الخط المستخدم في التطبيق
  fontFamily: 'main',
  // لون الخلفية المستخدمة في التطبيق
  scaffoldBackgroundColor: Color.fromARGB(246, 254, 254, 254),
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.white,
    iconTheme: IconThemeData(color: Colors.black),
  ),
  inputDecorationTheme: InputDecorationTheme(
    hintStyle: TextStyle(
      color: Colors.black.withOpacity(0.5),
      fontWeight: FontWeight.normal,
      fontSize: 16.0,
    ),
    border: InputBorder.none,
  ),
  iconTheme: IconThemeData(color: Colors.black),
  iconButtonTheme: IconButtonThemeData(
      style: ButtonStyle(
    iconColor: MaterialStateProperty.all(Colors.black),
  )),
  textSelectionTheme: TextSelectionThemeData(
    cursorColor: Colors.green,
    selectionColor: Colors.blue.withOpacity(0.4),
    selectionHandleColor: Colors.red,
  ),
  textTheme: TextTheme(
    headlineMedium: TextStyle(
      color: Colors.black,
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      textBaseline: TextBaseline.alphabetic,
    ),
    bodySmall: TextStyle(
      fontSize: 13,
    ),
    displayLarge: TextStyle(
      color: Colors.black, // لون النص
      fontSize: 22, // حجم الخط
      letterSpacing: 1, // المساف بين الحروف
      fontWeight: FontWeight.bold, // وزن الخط
    ),
    displayMedium: TextStyle(
      color: Colors.black,
      fontSize: 20, // حجم الخط
      letterSpacing: 1, // المساف بين الحروف
      fontWeight: FontWeight.bold, // وزن الخط
    ),
    displaySmall: TextStyle(
      color: Colors.black,
      fontSize: 16, // حجم الخط
      letterSpacing: 1, // المساف بين الحروف
      fontWeight: FontWeight.bold, // وزن الخط
    ),
    // هذه هي إعدادات النص الخاصة ب الاقتباس
    bodyLarge: TextStyle(
      fontSize: 22.0, // حجم الخط
      color: Colors.white, // لون الخط
      fontWeight: FontWeight.bold, // وزن الخط
    ),
    // هذه هي إعدادات النص الخاصة ب مصدر الاقتباس
    labelMedium: TextStyle(
      fontSize: 18.0, // حجم الخط
      color: Colors.white, // لون الخط
      fontStyle: FontStyle.italic,
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Color.fromARGB(255, 240, 237, 237), // لون خلفية الشريط
    selectedItemColor: Colors.black, // لون العنصر المختار
    // لون نص العنصر المختار
    selectedLabelStyle: TextStyle(
      fontWeight: FontWeight.bold, // وزن الخط
      letterSpacing: 0.6, // المساف بين الحروف
    ),
    // لون نص العنصر الغير مختار
    unselectedLabelStyle: TextStyle(
      fontWeight: FontWeight.w600, // وزن الخط
      letterSpacing: 0.4, // المساف بين الحروف
    ),
  ),
);
