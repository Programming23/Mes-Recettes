import 'package:flutter/material.dart';

import '../constants/texts.dart';
import '../constants/data.dart';
import '../widgets/recipes_body.dart';
import '../widgets/search_body.dart';
import 'recipe_page.dart';

class SearchPage extends StatefulWidget {
  final List recipes;
  final clickFavorite;

  SearchPage({
    required this.recipes,
    required this.clickFavorite,
  });

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String _searchQuery = '';
  TextEditingController searchController = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final results = widget.recipes
        .where((item) => item['name']
            .toString()
            .toLowerCase()
            .contains(_searchQuery.toLowerCase()))
        .toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: TextField(
          controller: searchController,
          textDirection: TextDirection.rtl,
          style: Theme.of(context).textTheme.headlineMedium,
          decoration: InputDecoration(
            hintText: hintSearchInput,
            hintTextDirection: TextDirection.rtl,
            border: InputBorder.none,
          ),
          onChanged: (value) {
            setState(() {
              _searchQuery = value;
            });
          },
        ),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: Icon(
              Icons.clear,
              color: Colors.black,
            ),
            onPressed: () {
              setState(() {
                _searchQuery = '';
              });
              searchController.clear();
            },
          ),
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_forward,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: SearchBody(
        results: results,
        clickFavorite: widget.clickFavorite,
      ),
    );
  }
}
