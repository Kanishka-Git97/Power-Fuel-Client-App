import 'package:flutter/material.dart';
import 'package:power_fuel_client_app/presentation/molecules/fuel_station_details.dart';
import '../../constants/constants.dart';
import '../molecules/vehicle_details_card.dart';
import '../molecules/custom_bottom_navigation.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var timeNow = DateTime.now().hour;
  String greetingMessage() {
    if (timeNow <= 12) {
      return 'Good Morning, ';
    } else if ((timeNow > 12) && (timeNow <= 16)) {
      return 'Good Afternoon, ';
    } else {
      return 'Good Evening, ';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.white,
            pinned: true,
            elevation: 5,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                color: Colors.white,
                // margin: const EdgeInsets.only(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20, top: 40),
                          child: CircleAvatar(),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, top: 40),
                          child: Text(greetingMessage(),
                              textAlign: TextAlign.start, style: mainHeading),
                        ),
                        const Padding(
                          padding: EdgeInsets.only( top: 40),
                          child: Text(
                            "Sandini",
                            style: mainHeading,
                          ),
                        ),
                      ],
                    ),
                    FuelStationDetails()
                  ],
                ),
              ),
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(0),
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                ),
                child: const Padding(
                  padding: EdgeInsets.only(left: 20, top: 15),
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
      bottomNavigationBar: const CustomBottomNavigationBar(index: 0),
    );
  }
}
