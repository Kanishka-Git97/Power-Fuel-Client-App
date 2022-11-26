import 'package:flutter/material.dart';

import '../../../constants/constants.dart';
import '../../atoms/navigation_button.dart';

class ViewVehiclesScreen extends StatelessWidget {
  const ViewVehiclesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor: primaryColor,
        leading: const NavigationButton(),
        title: const Text(
          "Vehicle Details",
          style: mainHeading,
        ),
      ),
    );
  }
}