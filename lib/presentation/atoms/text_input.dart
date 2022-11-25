import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  const TextInput({Key? key, required this.hintText, required this.labelText, required this.keyboardType, required this.icon})
      : super(key: key);

  final String hintText;
  final String labelText;
  final TextInputType keyboardType;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        prefixIcon: icon,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
        ),
      ),
      keyboardType: keyboardType,
      textInputAction: TextInputAction.done,
    );
  }
}
