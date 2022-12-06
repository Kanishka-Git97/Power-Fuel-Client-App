import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import '../../../constants/constants.dart';
import '../../../controllers/vehicle_controller.dart';
import '../../../models/customer.dart';
import '../../../models/vehicle.dart';
import '../../../presentation/atoms/navigation_button.dart';
import '../../../presentation/atoms/text_input.dart';
import '../../../presentation/molecules/custom_bottom_navigation.dart';
import '../../../presentation/screens/home_screen.dart';
import '../../../repositories/vehicle_repository.dart';


import '../../../providers/user_provider.dart';
import '../../atoms/primary_button.dart';

class EditVehicleScreen extends StatefulWidget {
  EditVehicleScreen({Key? key, required this.vehicle}) : super(key: key);

  Vehicle vehicle;
  @override
  State<EditVehicleScreen> createState() => _EditVehicleState();
}

class _EditVehicleState extends State<EditVehicleScreen> {
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

  //Set Form
  setForm(Vehicle _vehicle){
    setState(() {
      selectedfuel = _vehicle.fuelType.toString();
      selectedvehicle = _vehicle.vehicleType.toString();
      _registrationController.text = _vehicle.registration.toString();
      _chassisController.text = _vehicle.chassis.toString();
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
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: ((context) => const HomeScreen()),
          ));
      return notification("Vehicle is Successfully Registered", true);
    }
  }

  @override
  void initState() {
    super.initState();
    getDetails();
    setForm(widget.vehicle);
  }

  @override
  Widget build(BuildContext context) {
    //Provider Callback
    final Customer user = context.watch<User>().user;
    setState(() {
      _vehicle.customer = user.id;
    });
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white30,
        elevation: 0,
        leading: const NavigationButton(),
        title: Text(
          "Edit Vehicle",
          style: mainHeading,
        ),
      ),
      body: Container(
        color:  Colors.white30,
        margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              Text(
                "Edit Your Vehicle Details",
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
                  context, "  Select Fuel Type", selectedfuel, _fuelTypes,
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
                        text: "Edit",
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
