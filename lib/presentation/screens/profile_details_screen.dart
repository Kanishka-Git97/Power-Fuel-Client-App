import 'package:flutter/material.dart';
import 'package:power_fuel_client_app/presentation/molecules/custom_bottom_navigation.dart';

class ProfileDetailsScreen extends StatelessWidget {
  const ProfileDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavigationBar(index: 3),
    );
  }
}