import 'package:flutter/material.dart';

import '../../constants/constants.dart';

class VehicleDetailsCard extends StatelessWidget {
  const VehicleDetailsCard({Key? key,
  required this.regiNo,
      required this.chassisNo,
      required this.vehicleType,
      required this.fuelType,
      required this.availableQty}) : super(key: key);

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
                color: Colors.cyan.shade100,
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Text(
                          "Vehicle Registration Number : ",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
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
                  ],
                ),
              ),
            ),
          );
  }
  }