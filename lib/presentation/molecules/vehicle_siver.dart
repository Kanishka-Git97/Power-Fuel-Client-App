import 'package:flutter/material.dart';

import '../../constants/constants.dart';
import 'fuel_station_details.dart';
import 'vehicle_details_card.dart';

class VehicleSliver extends StatelessWidget {
  const VehicleSliver({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

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
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20, top: 40),
                              child: Text(greetingMessage(),
                                  textAlign: TextAlign.start,
                                  style: mainHeadingLight),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left:20, top: 4),
                              child: Text(
                                "Sandini Kaveesha",
                                style: subHeadingLight,
                              ),
                            ),
                          ],
                        ),
                       const  Padding(
                          padding: EdgeInsets.only(right: 20, top: 40),
                          child: Icon(
                            Icons.local_gas_station,
                            color: Colors.white,
                            size: 40,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10,),
                    const FuelStationDetails()
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
    );
  }
}