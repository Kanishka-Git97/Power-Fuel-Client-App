import 'package:flutter/material.dart';
import '../../../presentation/molecules/custom_bottom_navigation.dart';

class RequestFuelScreen extends StatelessWidget {
  const RequestFuelScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const CustomBottomNavigationBar(index: 2),
    );
  }
}
