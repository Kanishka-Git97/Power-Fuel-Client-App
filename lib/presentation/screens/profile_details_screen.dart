import 'package:flutter/material.dart';
import 'package:power_fuel_client_app/presentation/atoms/text_input.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import '../../constants/constants.dart';
import '../../presentation/atoms/navigation_button.dart';
import '../../presentation/molecules/custom_bottom_navigation.dart';

class ProfileDetailsScreen extends StatefulWidget {
  const ProfileDetailsScreen({Key? key}) : super(key: key);

  @override
  State<ProfileDetailsScreen> createState() => _ProfileDetailsScreenState();
}

class _ProfileDetailsScreenState extends State<ProfileDetailsScreen> {
  //TextEditing Controller Setup
  final _nameController = new TextEditingController();
  final _nicController = new TextEditingController();
  final _addressController = new TextEditingController();
  final _emailController = new TextEditingController();
  final _passwordController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white30,
        elevation: 0,
        title: Text("Profile", style: mainHeading,),
        leading: const NavigationButton(),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          color: Colors.white30,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextInput(
                      hintText: "Enter Full Name",
                      labelText: "Full Name",
                      keyboardType: TextInputType.name,
                      controller: _nameController,
                      enabled: false,
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
                    enabled: false,
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
                    enabled: false,
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
                    enabled: false,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextInput(
                    hintText: "District",
                    labelText: "District",
                    keyboardType: TextInputType.multiline,
                    controller: _addressController,
                    enabled: false,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextInput(
                    hintText: "Gas Station",
                    labelText: "Gas Station",
                    keyboardType: TextInputType.multiline,
                    controller: _addressController,
                    enabled: false,
                  ),
                ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(index: 3),
    );
  }
}