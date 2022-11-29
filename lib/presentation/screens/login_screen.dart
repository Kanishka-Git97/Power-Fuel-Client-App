import 'package:flutter/material.dart';
import 'package:power_fuel_client_app/controllers/customer_controller.dart';
import 'package:power_fuel_client_app/presentation/screens/registration_screen.dart';
import 'package:power_fuel_client_app/repositories/customer_repository.dart';

import '../../constants/constants.dart';
import '../atoms/primary_button.dart';
import '../atoms/text_input.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //Dependency Injection
  var _customerController = CustomerController(CustomerRepository());

  //TextEditing Controller
  final _emailController = new TextEditingController();
  final _passwordController = new TextEditingController();

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

  //Login
  Future login() async {
    //Front End Validation
    if (_emailController.value.text.isEmpty &&
        _passwordController.value.text.isEmpty)
      return notification("Required Fields are Missing!", false);

    var response = await _customerController.login(
        _emailController.text, _passwordController.text);
    print("Email:${_emailController.text}");
    print("Password: ${_passwordController.text}");
    if (response.id == null)
      return notification("Email or Password is Incorrect!", false);
    else {
      return notification("Logged In!", true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(
                  child: Text(
                    "Sign In",
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
                        builder: ((context) => const RegisterScreen()),
                      ),
                    );
                  },
                  child: const Text(
                    "Don't have a account? SIgn Up here",
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.blue),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextInput(
                    hintText: "Enter Username",
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
                    hintText: "Enter Password",
                    labelText: "Password",
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    controller: _passwordController,
                  ),
                ),
                const SizedBox(
                  height: 100,
                ),
                Row(
                  children: [
                    PrimaryButton(
                        onTap: login,
                        text: "Sign In",
                        buttonColor: Colors.redAccent,
                        textColor: Colors.white),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
