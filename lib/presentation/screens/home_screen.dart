import 'package:flutter/material.dart';
import '../molecules/vehicle_siver.dart';
import '../molecules/custom_bottom_navigation.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: VehicleSliver(),
      bottomNavigationBar: const CustomBottomNavigationBar(index: 0),
    );
  }
}
