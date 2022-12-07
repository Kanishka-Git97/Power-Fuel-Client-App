import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:power_fuel_client_app/presentation/molecules/custom_bottom_navigation.dart';
import 'package:power_fuel_client_app/presentation/molecules/fuel_purchase_details.dart';
import 'package:power_fuel_client_app/presentation/molecules/request_slot.dart';
=======
import '../../../presentation/molecules/custom_bottom_navigation.dart';
import '../../../presentation/molecules/fuel_purchase_details.dart';
>>>>>>> 7dcf99c5cc3759bcced5443cdf9f4c6bf61e4c5e

import '../../../constants/constants.dart';
import '../../atoms/navigation_button.dart';

class RequestListScreen extends StatelessWidget {
  const RequestListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white30,
        elevation: 0,
        leading: const NavigationButton(),
        title: Text(
          " Fuel Request List",
          style: mainHeading,
        ),
      ),
<<<<<<< HEAD
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        child: const RequestSlot(),
=======
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white30,
          padding: const EdgeInsets.symmetric( vertical: 30, horizontal: 20),
          child: const FuelPurchaseDetails(),
        ),
>>>>>>> 7dcf99c5cc3759bcced5443cdf9f4c6bf61e4c5e
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(index: 2),
    );
  }
}
