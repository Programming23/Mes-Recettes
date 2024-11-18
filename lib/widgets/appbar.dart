import 'package:flutter/material.dart';
import '/constants/texts.dart';

mainAppBar({required data, leading = false}) {
  return AppBar(
      backgroundColor: Colors.white,
      centerTitle: true,
      title: Text(
        title,
        style: TextStyle(
          color: Colors.black,
        ),
      ),
      automaticallyImplyLeading: false,
      actions: [
        Builder(
          builder: (context) {
            return IconButton(
              icon: Icon(
                Icons.search,
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/search', arguments: data);
              },
            );
          },
        ),
        if (leading)
          Builder(builder: (context) {
            return IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(
                  Icons.arrow_forward,
                ));
          }),
      ]);
}
