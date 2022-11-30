import 'package:flutter/material.dart';
import 'package:power_fuel_client_app/presentation/molecules/custom_bottom_navigation.dart';

class RequestListScreen extends StatelessWidget {
  const RequestListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavigationBar(index: 2),
    );
  }
}