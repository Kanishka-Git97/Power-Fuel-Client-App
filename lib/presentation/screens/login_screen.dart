import 'package:flutter/material.dart';

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
                  height: 60,
                ),
                const TextInput(
                  hintText: "Enter Username",
                  labelText: "Email Address",
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(
                  height: 20,
                ),
                const TextInput(
                  hintText: "Enter Password",
                  labelText: "Password",
                  keyboardType: TextInputType.visiblePassword,
                ),
                const SizedBox(
                  height: 100,
                ),
                Row(
                  children: [
                    PrimaryButton(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HomeScreen()));
                        },
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
