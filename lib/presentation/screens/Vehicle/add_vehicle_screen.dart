import 'package:flutter/material.dart';
import 'package:power_fuel_client_app/constants/constants.dart';
import 'package:power_fuel_client_app/controllers/vehicle_controller.dart';
import 'package:power_fuel_client_app/models/vehicle.dart';
import 'package:power_fuel_client_app/presentation/atoms/navigation_button.dart';
import 'package:power_fuel_client_app/presentation/atoms/text_input.dart';
import 'package:power_fuel_client_app/presentation/molecules/custom_bottom_navigation.dart';
import 'package:power_fuel_client_app/presentation/screens/home_screen.dart';
import 'package:power_fuel_client_app/repositories/vehicle_repository.dart';
import 'package:snippet_coder_utils/FormHelper.dart';

import '../../atoms/primary_button.dart';
import 'view_vehicles_screen.dart';

class AddVehicleScreen extends StatefulWidget {
  const AddVehicleScreen({Key? key}) : super(key: key);

  @override
  State<AddVehicleScreen> createState() => _AddVehicleState();
}

class _AddVehicleState extends State<AddVehicleScreen> {
  //Dependency Injection
  var _vehicleController = VehicleController(VehicleRepository());

  //Variables
  List<dynamic> _vehicleTypes = [];
  List<dynamic> _fuelTypes = [];
  String? selectedvehicle;
  String? selectedfuel;
  final Vehicle _vehicle = Vehicle();

  //TextEditing Controllers
  final _registrationController = new TextEditingController();
  final _chassisController = new TextEditingController();

  //Get Details
  Future getDetails() async {
    List<dynamic> _vehicleResponse =
        await _vehicleController.fetchVehicleTypes();
    List<dynamic> _fuelResponse = await _vehicleController.fetchFuelTypes();
    setState(() {
      _vehicleTypes = _vehicleResponse;
      _fuelTypes = _fuelResponse;
    });
  }

  //Notifications
  notification(msg, bool success) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(msg),
        backgroundColor: (success ? Colors.greenAccent : Colors.redAccent),
        action: SnackBarAction(
          label: 'Dismiss',
          onPressed: () {},
        ),
      ),
    );
  }

  //Vehicle Registration
  Future register() async {
    //Front End Validation
    if (_registrationController.value.text.isEmpty &&
        _chassisController.value.text.isEmpty &&
        selectedfuel == null &&
        selectedvehicle == null) {
      return notification("Required Fields are Missing!", false);
    }
    _vehicle.registration = _registrationController.text;
    _vehicle.chassis = _chassisController.text;
    _vehicle.fuelType = int.parse(selectedfuel.toString());
    _vehicle.vehicleType = int.parse(selectedvehicle.toString());

    var response = await _vehicleController.save(_vehicle);
    if (response == 'Duplicate') {
      return notification("Already Exist Vehicle Details!", false);
    } else {
      return notification("Vehicle is Successfully Registered", true);
    }
  }

  @override
  void initState() {
    super.initState();
    getDetails();
  }

  @override
  Widget build(BuildContext context) {
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
              const Text(
                "Add Your Vehicle Details",
                style: formTitle,
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextInput(
                  hintText: "Add Vehicle Registration Number",
                  labelText: "Registration Number",
                  keyboardType: TextInputType.text,
                  controller: _registrationController,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextInput(
                  hintText: "Add Vehicle Chassis Number",
                  labelText: "Chassis Number",
                  keyboardType: TextInputType.text,
                  controller: _chassisController,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              FormHelper.dropDownWidget(context, "  Select Vehicle Type",
                  selectedvehicle, _vehicleTypes, (onChangedVal) {
                setState(() {
                  selectedvehicle = onChangedVal;
                });
              }, (onValidateVal) {},
                  borderRadius: 12, optionLabel: "type", optionValue: "id"),
              const SizedBox(
                height: 20,
              ),
              FormHelper.dropDownWidget(
                  context, "  Select FUel Type", selectedfuel, _fuelTypes,
                  (onChangedVal) {
                setState(() {
                  selectedfuel = onChangedVal;
                });
              }, (onValidateVal) {},
                  borderRadius: 12, optionLabel: "type", optionValue: "id"),
              const SizedBox(
                height: 20,
              ),
              SafeArea(
                child: Row(
                  children: [
                    PrimaryButton(
                        onTap: register,
                        text: "Register",
                        buttonColor: primaryColor,
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
