import 'package:flutter/material.dart';
import 'package:power_fuel_client_app/constants/constants.dart';
import 'package:power_fuel_client_app/presentation/atoms/primary_button.dart';
import 'package:power_fuel_client_app/presentation/screens/login_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Image(
            image: AssetImage('assets/images/logo.png'),
            height: 100,
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Welcome,",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
            child: Text(
              "Your Request is Processing Please Wait for the account Verification within 24 Hour Your Account Will be Active",
              textAlign: TextAlign.justify,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: 200,
            child: PrimaryButton(
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: ((context) => const LoginScreen()),
                      ));
                },
                text: "Go To Login",
                buttonColor: primaryColor,
                textColor: textColor),
          )
        ],
      )),
    );
  }
}
