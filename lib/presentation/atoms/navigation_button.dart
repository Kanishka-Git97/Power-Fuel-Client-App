import 'package:flutter/material.dart';
import 'package:power_fuel_client_app/constants/constants.dart';

class NavigationButton extends StatelessWidget {
  const NavigationButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() => Navigator.pop(context)),
      child: const Padding(
        padding: EdgeInsets.only(left: 20),
        child: Icon(
          Icons.arrow_back_ios,
          size: 30,
          color: textColor,
        ),
      ),
    );
  }
}
