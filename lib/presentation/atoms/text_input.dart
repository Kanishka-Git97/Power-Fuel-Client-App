import 'package:flutter/material.dart';
import 'package:power_fuel_client_app/constants/constants.dart';

class TextInput extends StatelessWidget {
  const TextInput({Key? key, required this.hintText, required this.labelText, required this.keyboardType, })
      : super(key: key);

  final String hintText;
  final String labelText;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: formTitle,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        floatingLabelStyle: const TextStyle(color: primaryColor),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
        ),
      ),
      keyboardType: keyboardType,
      textInputAction: TextInputAction.done,
    );
  }
}
