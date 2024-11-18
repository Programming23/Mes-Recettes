import 'package:flutter/material.dart';

class AboutUsText extends StatelessWidget {
  const AboutUsText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      'نحن فريق متخصص في تطوير التطبيقات والمواقع، ونسعى لتقديم أفضل الخدمات لعملائنا. تطبيقنا مخصص لعشاق الطبخ التعلم حيث يوفر للمستخدمين مجموعة كبيرة من الوصفات الرائعة من مصادر مختلفة، ويتيح لهم حفظ المفضلة. كما أننا نهتم بتصميم التطبيق بشكل جميل وسهل الاستخدام لتجربة ممتعة للمستخدمين.',
      style: TextStyle(
        fontSize: 12, // حجم الخط
        fontWeight: FontWeight.w500, // وزن الخط
        letterSpacing: 0.3, // الميافة بين الحروف
      ),
    );
  }
}
