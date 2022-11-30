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

  //Greeting Generator
  var timeNow = DateTime.now().hour;
  String greetingMessage() {
    if (timeNow <= 12) {
      return 'Good Morning, ';
    } else if ((timeNow > 12) && (timeNow <= 16)) {
      return 'Good Afternoon, ';
    } else {
      return 'Good Evening, ';
    }
  }


  @override
  Widget build(BuildContext context) {
    //Provider Callback
    final Customer user = context.watch<User>().user;
    return Scaffold(
      body: VehicleSliver(),
      bottomNavigationBar: const CustomBottomNavigationBar(index: 0),
    );
  }
}
