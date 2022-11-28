// ignore_for_file: unnecessary_new

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:power_fuel_client_app/constants/constants.dart';
import 'package:power_fuel_client_app/controllers/customer_controller.dart';
import 'package:power_fuel_client_app/controllers/district_controller.dart';
import 'package:power_fuel_client_app/controllers/gas_station_controller.dart';
import 'package:power_fuel_client_app/models/customer.dart';
import 'package:power_fuel_client_app/presentation/atoms/primary_button.dart';
import 'package:power_fuel_client_app/presentation/atoms/text_input.dart';
import 'package:power_fuel_client_app/presentation/screens/home_screen.dart';
import 'package:power_fuel_client_app/presentation/screens/login_screen.dart';
import 'package:power_fuel_client_app/repositories/customer_repository.dart';
import 'package:power_fuel_client_app/repositories/district_repository.dart';
import 'package:power_fuel_client_app/repositories/gas_station_repository.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:http/http.dart' as http;

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => TextEditing();
}

class TextEditing extends State<RegisterScreen> {
  //Dependency Injection
  var _districtController = DistrictController(DistrictRepository());
  var _stationController = GasStationController(GasStationRepository());
  var _customerController = CustomerController(CustomerRepository());

  //Variables
  List<dynamic> _districtList = [];
  List<dynamic> _gasStationList = [];
  String? selectedDistrict;
  String? selectedGasStation;
  final Customer _customer = Customer();

  //TextEditing Controller Setup
  final _nameController = new TextEditingController();
  final _nicController = new TextEditingController();
  final _addressController = new TextEditingController();
  final _emailController = new TextEditingController();
  final _passwordController = new TextEditingController();
  final _confirmPasswordController = new TextEditingController();

  //Get District Data
  Future getDistricts() async {
    List<dynamic> _data = await _districtController.fetchDistrictsRaw();
    setState(() {
      _districtList = _data;
    });
  }

  //Get Gas Stations Data
  Future loadStation(district) async {
    List<dynamic> _data = await _stationController.fetchGasStationRaw(district);
    setState(() {
      _gasStationList = _data;
      print(_gasStationList);
    });
  }

  //Customer Registration
  Future register() async {
    if (_nameController.value.text.isEmpty &&
        _nicController.value.text.isEmpty &&
        _addressController.value.text.isEmpty &&
        _emailController.value.text.isEmpty &&
        _passwordController.value.text.isEmpty &&
        _confirmPasswordController.value.text.isEmpty)
      return "Required Fields are Missing";
    if (_passwordController.text != _confirmPasswordController.text)
      return "Passwords Doesnt Match";

    _customer.name = _nameController.text;
    _customer.nic = _nicController.text;
    _customer.address = _addressController.text;
    _customer.email = _emailController.text;
    _customer.password = _passwordController.text;

    var response = await _customerController.register(_customer);
    print(response);
    //print(_customer.station);
  }

  @override
  void initState() {
    super.initState();
    getDistricts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 50, bottom: 30, left: 20, right: 20),
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Text(
                  "Sign Up",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                    color: primaryColor,
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: ((context) => const LoginScreen()),
                    ),
                  );
                },
                child: const Text(
                  "Already have a account? SIgn In here",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Colors.blue),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Account Information",
                style: formTitle,
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextInput(
                  hintText: "Enter Full Name",
                  labelText: "Full Name",
                  keyboardType: TextInputType.name,
                  controller: _nameController,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextInput(
                  hintText: "Enter Valid NIC Number",
                  labelText: "NIC",
                  keyboardType: TextInputType.text,
                  controller: _nicController,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextInput(
                  hintText: "Enter Address",
                  labelText: "Address",
                  keyboardType: TextInputType.multiline,
                  controller: _addressController,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Setup Gas Station Information",
                style: formTitle,
              ),
              const SizedBox(
                height: 20,
              ),
              FormHelper.dropDownWidget(context, "Select Nearest District",
                  selectedDistrict, _districtList, (onChangedVal) {
                loadStation(onChangedVal);
                setState(() {
                  selectedDistrict = onChangedVal;
                  _customer.district = int.tryParse(onChangedVal);
                });
              }, (onValidateVal) {},
                  borderRadius: 12, optionLabel: "district", optionValue: "id"),
              const SizedBox(
                height: 20,
              ),
              FormHelper.dropDownWidget(context, "Select Nearest Gas Station",
                  selectedGasStation, _gasStationList, (onChangedVal) {
                setState(() {
                  selectedGasStation = onChangedVal;
                  _customer.station = int.tryParse(onChangedVal);
                });
              }, (onValidateVal) {},
                  borderRadius: 12, optionLabel: "name", optionValue: "id"),
              const SizedBox(
                height: 20,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Setup Your Login Details",
                  style: formTitle,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextInput(
                  hintText: "Enter your Valid Email",
                  labelText: "Email Address",
                  keyboardType: TextInputType.emailAddress,
                  controller: _emailController,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextInput(
                  hintText: "Enter Your Password",
                  labelText: "New Password",
                  keyboardType: TextInputType.visiblePassword,
                  controller: _passwordController,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextInput(
                  hintText: "Confirm Your Password",
                  labelText: "Confirm Password",
                  keyboardType: TextInputType.visiblePassword,
                  controller: _confirmPasswordController,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SafeArea(
                child: Row(
                  children: [
                    PrimaryButton(
                        onTap: register,
                        text: "Sign Up",
                        buttonColor: primaryColor,
                        textColor: Colors.white),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
