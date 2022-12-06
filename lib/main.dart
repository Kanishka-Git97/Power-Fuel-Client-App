import 'package:flutter/material.dart';

import 'package:power_fuel_client_app/presentation/screens/Vehicle/add_vehicle_screen.dart';
import 'package:power_fuel_client_app/presentation/screens/home_screen.dart';
import 'package:power_fuel_client_app/providers/user_provider.dart';
import 'package:provider/provider.dart';

import '../constants/constants.dart';
import '../presentation/screens/registration_screen.dart';
import 'presentation/screens/login_screen.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => User(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Power-Fuel-Client-App',
      color: Colors.white,
      theme: ThemeData(
          inputDecorationTheme: InputDecorationTheme(
              enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: secondaryColor),
                  borderRadius: BorderRadius.circular(12)),
              focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: primaryColor),
                  borderRadius: BorderRadius.circular(12)))),
      home: const LoginScreen(),
    );
  }
}
