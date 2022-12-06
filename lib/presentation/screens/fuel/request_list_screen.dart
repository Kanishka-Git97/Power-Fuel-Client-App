import 'package:flutter/material.dart';
import '../../../presentation/molecules/custom_bottom_navigation.dart';
import '../../../presentation/molecules/fuel_purchase_details.dart';

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
      body: Container(
        color: Colors.white30,
        margin: const EdgeInsets.symmetric( vertical: 30, horizontal: 20),
        child: const FuelPurchaseDetails(),
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(index: 2),
    );
  }
}