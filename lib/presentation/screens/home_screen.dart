import 'package:flutter/material.dart';
import 'package:power_fuel_client_app/constants/constants.dart';
import 'package:power_fuel_client_app/presentation/atoms/primary_button.dart';
import 'package:power_fuel_client_app/presentation/screens/Vehicle/add_vehicle.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  PrimaryButton(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const AddVehicle()),
                        );
                      },
                      text: "Add vehicle",
                      buttonColor: primaryColor,
                      textColor: textColor),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  PrimaryButton(
                      onTap: () {},
                      text: "Add Fuel Request",
                      buttonColor: primaryColor,
                      textColor: textColor),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
