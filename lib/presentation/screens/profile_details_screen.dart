import 'package:flutter/material.dart';
import '../../constants/constants.dart';
import '../../presentation/atoms/navigation_button.dart';
import '../../presentation/molecules/custom_bottom_navigation.dart';

class ProfileDetailsScreen extends StatelessWidget {
  const ProfileDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white30,
        elevation: 0,
        title: Text("Profile", style: mainHeading,),
        leading: const NavigationButton(),
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(index: 3),
    );
  }
}