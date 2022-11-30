import 'package:flutter/material.dart';
import 'package:power_fuel_client_app/controllers/gas_station_controller.dart';
import 'package:power_fuel_client_app/models/station.dart';
import 'package:power_fuel_client_app/presentation/molecules/fuel_station_details.dart';
import 'package:power_fuel_client_app/providers/user_provider.dart';
import 'package:power_fuel_client_app/repositories/gas_station_repository.dart';
import 'package:provider/provider.dart';
import '../../constants/constants.dart';
import '../../models/customer.dart';
import '../molecules/vehicle_details_card.dart';
import '../molecules/custom_bottom_navigation.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //Greeting Generator
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
    //Provider Callback
    final Customer user = context.watch<User>().user;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.white,
            pinned: true,
            elevation: 5,
            expandedHeight: 350,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                color: const Color(0xffC95F0D),
                // margin: const EdgeInsets.only(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20, top: 40),
                              child: Text(greetingMessage(),
                                  textAlign: TextAlign.start,
                                  style: mainHeadingLight),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20, top: 4),
                              child: Text(
                                "${user.name}",
                                style: subHeadingLight,
                              ),
                            ),
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.only(right: 20, top: 40),
                          child: Icon(
                            Icons.local_gas_station,
                            color: Colors.white,
                            size: 40,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    FuelStationDetails(
                      customer: user,
                    )
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
              childCount: 4,
            ),
          ),
        ],
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(index: 0),
    );
  }
}
