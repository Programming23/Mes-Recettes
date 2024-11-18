import 'package:flutter/material.dart';

import '../constants/numbers.dart';
import '../screens/recipe_page.dart';

class SearchBody extends StatelessWidget {
  const SearchBody({
    super.key,
    required this.results,
    required this.clickFavorite,
  });
  final clickFavorite;
  final List results;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: ListView.builder(
        itemCount: results.length,
        itemBuilder: (context, index) {
          bool is_link =
              results[index]['imageUrl'].toString().startsWith('http');
          return InkWell(
            hoverColor: Color.fromARGB(255, 236, 234, 234),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => RecipeDetailPage(
                  recipe: results[index],
                  clickFavorite: clickFavorite,
                ),
              ));
            },
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  ClipOval(
                    child: is_link
                        ? Image.network(
                            results[index]['imageUrl'],
                            fit: BoxFit.cover,
                            width: width_image_search,
                            height: height_image_search,
                          )
                        : Image.asset(
                            results[index]['imageUrl'],
                            fit: BoxFit.cover,
                            width: width_image_search,
                            height: height_image_search,
                          ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    results[index]['name'],
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
