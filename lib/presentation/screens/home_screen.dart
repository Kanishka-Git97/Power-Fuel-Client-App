import 'package:flutter/material.dart';

import '../molecules/vehicle_siver.dart';

import 'package:power_fuel_client_app/controllers/gas_station_controller.dart';
import 'package:power_fuel_client_app/models/station.dart';
import 'package:power_fuel_client_app/presentation/molecules/fuel_station_details.dart';
import 'package:power_fuel_client_app/providers/user_provider.dart';
import 'package:power_fuel_client_app/repositories/gas_station_repository.dart';
import 'package:provider/provider.dart';
import '../../constants/constants.dart';
import '../../models/customer.dart';
import '../molecules/vehicle_details_card.dart';

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
