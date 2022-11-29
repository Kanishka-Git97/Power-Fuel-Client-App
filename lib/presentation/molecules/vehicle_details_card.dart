import 'package:flutter/material.dart';
import 'package:power_fuel_client_app/presentation/atoms/custom_icon_button.dart';
import 'package:power_fuel_client_app/presentation/screens/profile_details_screen.dart';

import '../../constants/constants.dart';

class VehicleDetailsCard extends StatelessWidget {
  const VehicleDetailsCard(
      {Key? key,
      required this.regiNo,
      required this.chassisNo,
      required this.vehicleType,
      required this.fuelType,
      required this.availableQty})
      : super(key: key);

  final String regiNo;
  final String chassisNo;
  final String vehicleType;
  final String fuelType;
  final dynamic availableQty;

  @override
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 20),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                  color: primaryColor, width: 1, style: BorderStyle.solid),
              borderRadius: const BorderRadius.all(Radius.circular(10))),
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Column(
            children: [
              Row(
                children: [
                  const Text(
                    "Vehicle Registration Number : ",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "    " + regiNo,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  const Text(
                    "Vehicle Chassis Number : ",
                    style: normalText,
                  ),
                  Text(
                    "    " + chassisNo,
                    style: normalText,
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  const Text(
                    "Vehicle Type : ",
                    style: normalText,
                  ),
                  Text(
                    "    " + vehicleType,
                    style: normalText,
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  const Text(
                    "Available Quantity : ",
                    style: normalText,
                  ),
                  Text(
                    "    " + availableQty,
                    style: normalText,
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomIconButton(
                      customIcon: Icons.qr_code,
                      onTapButton: () {},
                      ),
                      CustomIconButton(
                      customIcon: Icons.add,
                      onTapButton: () {},),
                      CustomIconButton(
                      customIcon: Icons.edit,
                      onTapButton: () {},),
                       CustomIconButton(
                      customIcon: Icons.delete,
                      onTapButton: () {},),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
