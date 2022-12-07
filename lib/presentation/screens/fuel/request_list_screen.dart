import 'package:flutter/material.dart';
import 'package:power_fuel_client_app/presentation/molecules/custom_bottom_navigation.dart';
import 'package:power_fuel_client_app/presentation/molecules/fuel_purchase_details.dart';
import 'package:power_fuel_client_app/presentation/molecules/request_slot.dart';

import '../../../constants/constants.dart';
import '../../atoms/navigation_button.dart';

class RequestListScreen extends StatelessWidget {
  const RequestListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        leading: const NavigationButton(),
        title: const Text(
          " Fuel Request List",
          style: mainHeading,
        ),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        child: const RequestSlot(),
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(index: 2),
    );
  }
}
