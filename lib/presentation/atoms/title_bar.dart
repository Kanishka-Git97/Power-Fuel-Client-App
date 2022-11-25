import 'package:flutter/material.dart';

import 'navigation_button.dart';

class TitleBar extends StatelessWidget implements PreferredSizeWidget {
  TitleBar({Key? key, required this.text, required this.filterOnPress})
      : super(key: key);

  final String text;
  VoidCallback filterOnPress;
  @override
  Size get preferredSize => const Size.fromHeight(60);
  @override
  Widget build(BuildContext context) {
    return AppBar(
        title: Text(
          text,
          style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w400,
              letterSpacing: -0.3,
              color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const NavigationButton(),
        actions: [
          GestureDetector(
            onTap: filterOnPress,
            child: const Padding(
              padding: EdgeInsets.only(right: 24),
              child: Icon(
                Icons.filter_list,
                color: Colors.black,
              ),
            ),
          ),
        ]);
  }
}