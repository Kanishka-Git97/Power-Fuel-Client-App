import 'package:flutter/material.dart';

import '../../constants/constants.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton(
      {Key? key, required this.customIcon, required this.onTapButton})
      : super(key: key);
  final IconData customIcon;
  final VoidCallback onTapButton;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapButton,
      child: Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
             border: Border.all(
                  color: primaryColor, width: 1, style: BorderStyle.solid),
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
              color: secondaryColor),
          padding: const EdgeInsets.all(5),
          child: Icon(
            customIcon,
            color: Colors.white,
          )),
    );
  }
}
