import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:power_fuel_client_app/constants/constants.dart';
import 'package:power_fuel_client_app/controllers/customer_controller.dart';
import 'package:power_fuel_client_app/controllers/district_controller.dart';
import 'package:power_fuel_client_app/presentation/atoms/primary_button.dart';
import 'package:power_fuel_client_app/presentation/atoms/text_input.dart';
import 'package:power_fuel_client_app/presentation/screens/home_screen.dart';
import 'package:power_fuel_client_app/presentation/screens/login_screen.dart';
import 'package:power_fuel_client_app/repositories/customer_repository.dart';
import 'package:power_fuel_client_app/repositories/district_repository.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:http/http.dart' as http;

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => TextEditing();
}

class TextEditing extends State<RegisterScreen> {
  //Dependency Injection
  //var _districtController = DistrictController(DistrictRepository());
  var _customerController = CustomerController(CustomerRepository());

  //Variables
  List<dynamic> _districtList = [];
  List<dynamic> _gasStationList = [];
  String? selectedDistrict;
  String? selectedGasStation;

  //Get District Data
  Future getDistricts() async {
    var response = await http.get(
        Uri.parse('http://192.168.8.101:8080/districts/all'),
        headers: {"Accept": "application/json"});
    var jasonBody = response.body;
    var jsonData = json.decode(jasonBody);
    List<dynamic> responseList = [];
    for (var i = 0; i < jsonData.length; i++) {
      responseList.add(jsonData[i]);
    }
    setState(() {
      _districtList = responseList;
    });
  }

  //TextEditing Controller Setup

  @override
  void initState() {
    super.initState();
    getDistricts();
    //this._districtList.add({"id": "0", "name": "Select District"});
    //print("District List: $_districtList");
    this._gasStationList.add({"id": "1", "name": "Galle - Piniduwa Shed"});
    print(_districtList);
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

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: TextInput(
                  hintText: "Enter Full Name",
                  labelText: "Full Name",
                  keyboardType: TextInputType.name,
                ),

              ),
              const SizedBox(
                height: 20,
              ),

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: TextInput(
                  hintText: "Enter Valid NIC Number",
                  labelText: "NIC",
                  keyboardType: TextInputType.text,
                ),

              ),
              const SizedBox(
                height: 20,
              ),

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: TextInput(
                  hintText: "Enter Address",
                  labelText: "Address",
                  keyboardType: TextInputType.multiline,
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
                setState(() {
                  selectedDistrict = onChangedVal;
                  print(selectedDistrict);
                });
              }, (onValidateVal) {},
                  borderRadius: 12, optionLabel: "district", optionValue: "id"),

              const SizedBox(
                height: 20,
              ),
              FormHelper.dropDownWidget(

                  context,
                  "Select Nearest Gas Station",
                  selectedGasStation,
                  _gasStationList,
                  (onChangedVal) {},
                  (onValidateVal) {},
                  borderRadius: 12),

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

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: TextInput(
                  hintText: "Enter your Valid Email",
                  labelText: "Email Address",
                  keyboardType: TextInputType.emailAddress,
                ),

              ),
              const SizedBox(
                height: 20,
              ),

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: TextInput(
                  hintText: "Enter Your Password",
                  labelText: "New Password",
                  keyboardType: TextInputType.visiblePassword,
                ),

              ),
              const SizedBox(
                height: 20,
              ),

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: TextInput(
                  hintText: "Confirm Your Password",
                  labelText: "Confirm Password",
                  keyboardType: TextInputType.visiblePassword,
                ),

              ),
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
                        text: "Sign Up",

                        buttonColor:primaryColor,

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
