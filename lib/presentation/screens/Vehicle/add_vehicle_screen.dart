import 'package:flutter/material.dart';
import 'package:power_fuel_client_app/constants/constants.dart';
import 'package:power_fuel_client_app/presentation/atoms/navigation_button.dart';
import 'package:power_fuel_client_app/presentation/atoms/text_input.dart';
import 'package:power_fuel_client_app/presentation/molecules/custom_bottom_navigation.dart';
import 'package:power_fuel_client_app/presentation/screens/home_screen.dart';
import 'package:snippet_coder_utils/FormHelper.dart';

import '../../atoms/primary_button.dart';
import 'view_vehicles_screen.dart';

class AddVehicleScreen extends StatefulWidget {
  const AddVehicleScreen({Key? key}) : super(key: key);

  @override
  State<AddVehicleScreen> createState() => _AddVehicleState();
}

class _AddVehicleState extends State<AddVehicleScreen> {
  List<dynamic> _vehicleTypes = [];
  List<dynamic> _fuelTypes = [];
  String? selectedvehicle;
  String? selectedfuel;
  @override
  Widget build(BuildContext context) {
    void initState() {
      super.initState();
      this._vehicleTypes.add({"id": 1, "type": "Car"});
      this._vehicleTypes.add({"id": 2, "type": "Van"});
      this._fuelTypes.add({"id": 1, "name": "Petrol"});
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        leading: const NavigationButton(),
        title: const Text(
          "Add Vehicle",
          style: mainHeading,
        ),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              const Text("Add Your Vehicle Details",style: formTitle,),
              const SizedBox(height: 10,),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: TextInput(
                    hintText: "Add Vehicle Registration Number",
                    labelText: "Registration Number",
                    keyboardType: TextInputType.text),
              ),
              const SizedBox(
                height: 20,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: TextInput(
                    hintText: "Add Vehicle Chassis Number",
                    labelText: "Chassis Number",
                    keyboardType: TextInputType.text),
              ),
              const SizedBox(
                height: 20,
              ),
              FormHelper.dropDownWidget(
                  context,
                  "  Select Vehicle Type",
                  selectedvehicle,
                  _vehicleTypes,
                  (onChangedVal) {},
                  (onValidateVal) {},
                  borderRadius: 12),
              const SizedBox(
                height: 20,
              ),
              FormHelper.dropDownWidget(
                  context,
                  "  Select FUel Type",
                  selectedfuel,
                  _fuelTypes,
                  (onChangedVal) {},
                  (onValidateVal) {},
                  borderRadius: 12),
              const SizedBox(
                height: 20,
              ),
              SafeArea(
                child: Row(
                  children: [
                    PrimaryButton(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HomeScreen()));
                        },
                        text: "Submit",
                        buttonColor:primaryColor,
                        textColor: Colors.white),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(index: 1),
    );
  }
}
