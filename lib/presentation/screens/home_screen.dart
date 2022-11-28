import 'package:flutter/material.dart';
import 'package:power_fuel_client_app/constants/constants.dart';
import 'package:power_fuel_client_app/presentation/molecules/vehicle_details_card.dart';

import '../molecules/custom_bottom_navigation.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.white,
            pinned: true,
            elevation: 5,
            title: const Text(
              "Your Vehicles",
              style: mainHeading,
            ),
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                margin: const EdgeInsets.only(top: 60),
                child: Text("ADD CARD"),
              ),
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(0),
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white30,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(0),
                      topRight: Radius.circular(20)),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Your Vehicle Details",
                    style: mainHeading,
                  ),
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, int index) {
                return const VehicleDetailsCard(
                    regiNo: "FJIT4849",
                    chassisNo: "FDDFJO56544545",
                    vehicleType: "Van",
                    fuelType: "Petrol",
                    availableQty: "3");
              },
              childCount: 10,
            ),
          ),
        ],
      ),

      // const SizedBox(height: 10,),
      //  const SizedBox(
      //   height: 10,
      // ),
      // Row(
      //   children: [
      //     PrimaryButton(
      //         onTap: () {
      //           Navigator.push(
      //             context,
      //             MaterialPageRoute(builder: (context) => const AddVehicleScreen()),
      //           );
      //         },
      //         text: "Add vehicle",
      //         buttonColor: primaryColor,
      //         textColor: textColor),
      //   ],
      // ),
      // const SizedBox(
      //   height: 10,
      // ),
      // Row(
      //   children: [
      //     PrimaryButton(
      //         onTap: () {},
      //         text: "Add Fuel Request",
      //         buttonColor: primaryColor,
      //         textColor: textColor),

      bottomNavigationBar: const CustomBottomNavigationBar(index: 0),
    );
  }
}
