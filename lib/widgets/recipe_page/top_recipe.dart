import 'package:flutter/material.dart';

class TopRecipePage extends StatelessWidget {
  const TopRecipePage({
    super.key,
    required this.recipe,
  });

  final Map recipe;

  @override
  Widget build(BuildContext context) {
    bool is_link = recipe['imageUrl'].toString().startsWith('http');
    return Directionality(
      // اتجاه الواجهة
      textDirection: TextDirection.rtl,
      child: SliverAppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back, // الايقونة
            color: Colors.black, // لون الايقونة
          ),
        ),
        centerTitle: true, // النص في الوسط
        backgroundColor:
            Theme.of(context).scaffoldBackgroundColor, // لون الخلفية
        expandedHeight: MediaQuery.of(context).size.height / 3,
        flexibleSpace: FlexibleSpaceBar(
          background: is_link
              ? Image.network(
                  recipe['imageUrl'], // الصورة
                  fit: BoxFit.cover,
                )
              : Image.asset(
                  recipe['imageUrl'], // الصورة
                  fit: BoxFit.cover,
                ),
        ),
      ),
    );
  }
}
