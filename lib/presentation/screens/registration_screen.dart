import 'package:flutter/material.dart';
import 'package:power_fuel_client_app/constants/constants.dart';
import 'package:power_fuel_client_app/presentation/atoms/primary_button.dart';
import 'package:power_fuel_client_app/presentation/atoms/text_input.dart';
import 'package:power_fuel_client_app/presentation/screens/login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String? selectedItem = "item 1";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:   [
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
            height: 20,
          ),
          const Text(
            "Account Infromation",
            style: mainHeading,
          ),
          const SizedBox(
            height: 20,
          ),
          const TextInput(
            hintText: "Enter Full Name",
            labelText: "Full Name",
            keyboardType: TextInputType.name,
            icon: Icon(
              Icons.person,
              color: Colors.redAccent,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const TextInput(
            hintText: "Enter Valid NIC Number",
            labelText: "NIC",
            keyboardType: TextInputType.name,
            icon: Icon(Icons.file_copy_outlined, color: Colors.redAccent),
          ),
          const SizedBox(
            height: 20,
          ),
          const TextInput(
            hintText: "Enter Address",
            labelText: "Address",
            keyboardType: TextInputType.name,
            icon: Icon(Icons.location_city, color: Colors.redAccent),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Setup Gas Station Information",
            style: mainHeading,
          ),
          const SizedBox(
            height: 20,
          ),
          // DropdownButton<String>(
          //   value: selectedItem,
          //   items: items.map((item) => DropdownMenuItem(
          //     child: Text(item,style: normalText,),
          //     )).toList(),
          //     onChanged:(item)=>setState(() {
          //       selectedItem = item
          //     });
          //     ),
          const TextInput(
            hintText: "Enter Your Nearest District",
            labelText: "District",
            keyboardType: TextInputType.name,
            icon: Icon(
              Icons.person,
              color: Colors.redAccent,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const TextInput(
            hintText: "Enter Your Nearest Gas Station",
            labelText: "Gas Station",
            keyboardType: TextInputType.name,
            icon: Icon(Icons.home, color: Colors.redAccent),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Setup Your Login Details",
            style: mainHeading,
          ),
          const SizedBox(
            height: 20,
          ),
          const TextInput(
            hintText: "Enter your Valid Email",
            labelText: "Email Address",
            keyboardType: TextInputType.emailAddress,
            icon: Icon(
              Icons.email,
              color: Colors.redAccent,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const TextInput(
            hintText: "Enter Your Password",
            labelText: "New Password",
            keyboardType: TextInputType.visiblePassword,
            icon: Icon(Icons.password, color: Colors.redAccent),
          ),
          const SizedBox(
            height: 20,
          ),
          const TextInput(
            hintText: "Confirm Your Password",
            labelText: "Confirm Password",
            keyboardType: TextInputType.visiblePassword,
            icon: Icon(Icons.password, color: Colors.redAccent),
          ),
          const SizedBox(
            height: 20,
          ),
           SafeArea(
             child: Row(
               children: [
                 PrimaryButton(onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context)=>const LoginScreen()));},
                  text: "Sign Up", 
                  buttonColor: Colors.redAccent, 
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
