

import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../screens/Vehicle/add_vehicle.dart';
import '../screens/home_screen.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({Key? key, required this.index}) : super(key: key);

  final int index;

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _selectedIndex = 0;


  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.index;
  }
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GNav(
          selectedIndex: _selectedIndex,
          tabMargin: const EdgeInsets.symmetric(vertical: 5),
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          backgroundColor: Colors.white,
          color: Colors.white,
          activeColor: Colors.black,
          tabBackgroundColor: Colors.white,
          gap: 10,
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
          
          tabs: [
            GButton(
              icon: Icons.home,
              iconColor: Colors.black,
              text: 'Home',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                );
              },
            ),
            GButton(
              icon: Icons.contact_page,
              iconColor: Colors.black,
              text: 'Create',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AddVehicle(),
                  ),
                );
              },
            ),
          ]),
    );
  }
}
