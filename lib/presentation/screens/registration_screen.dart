import 'package:flutter/material.dart';
import 'package:power_fuel_client_app/presentation/atoms/password_input.dart';
import 'package:power_fuel_client_app/presentation/atoms/primary_button.dart';
import 'package:power_fuel_client_app/presentation/atoms/text_input.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
          child: Column(
            children: [
              const Text(
                "Sign Up",
                style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
              ),
              Text(
                  "Register With Power Fuel Client Platform for better Experience."),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(bottom: 30),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Text("Account Information"),
                        TextInput(
                            fieldTitle: "Full Name",
                            hintText: "Enter Full name"),
                        TextInput(
                            fieldTitle: "NIC",
                            hintText: "Enter Valid NIC Number"),
                        TextInput(
                            fieldTitle: "Address", hintText: "Enter Address"),
                        Text("Setup Gas Station Information"),
                        TextInput(
                            fieldTitle: "District",
                            hintText: "Enter your nearest District"),
                        TextInput(
                            fieldTitle: "Gas Station",
                            hintText: "Enter your nearest Gas Station"),
                        Text("Setup Your Login Details"),
                        TextInput(
                            fieldTitle: "Email Address",
                            hintText: "Enter your valid email"),
                        PasswordInput(
                            hintText: "Enter your password",
                            fieldTitle: "New Password"),
                        PasswordInput(
                            hintText: "Confirm your password",
                            fieldTitle: "Confirm Password"),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
