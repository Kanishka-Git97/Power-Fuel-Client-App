import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:power_fuel_client_app/presentation/screens/profile_details_screen.dart';

import '../../../presentation/screens/fuel/request_fuel_screen.dart';

import '../screens/Vehicle/add_vehicle_screen.dart';
import '../screens/fuel/request_list_screen.dart';
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
          tabBackgroundColor: const Color.fromARGB(255, 228, 228, 228),
          gap: 5,
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
              icon: Icons.add,
              iconColor: Colors.black,
              text: 'Add Vehicle',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AddVehicleScreen(),
                  ),
                );
              },
            ),
            GButton(
              icon: Icons.list,
              iconColor: Colors.black,
              text: 'Requests',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const RequestListScreen(),
                  ),
                );
              },
            ),
            GButton(
              icon: Icons.person,
              iconColor: Colors.black,
              text: "Profile",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProfileDetailsScreen(),
                  ),
                );
              },
            ),
          ]),
    );
  }
}
