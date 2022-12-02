import 'package:flutter/material.dart';
import 'package:power_fuel_client_app/controllers/vehicle_controller.dart';
import 'package:power_fuel_client_app/models/vehicle.dart';
import 'package:power_fuel_client_app/repositories/vehicle_repository.dart';
import 'package:provider/provider.dart';

import '../../constants/constants.dart';
import '../../models/customer.dart';
import '../../providers/user_provider.dart';
import 'fuel_station_details.dart';
import 'vehicle_details_card.dart';

class VehicleSliver extends StatefulWidget {
  const VehicleSliver({Key? key}) : super(key: key);

  @override
  State<VehicleSliver> createState() => _VehicleSliverState();
}

class _VehicleSliverState extends State<VehicleSliver> {
  //Dependency Injection
  var _vehicleController = VehicleController(VehicleRepository());

  //Provider Callback
  Customer customer = Customer();

  //GetDetails
  Future<List<Vehicle>> getDetails(int id) async {
    var response = await _vehicleController.fetchVehicles(id);
    return response;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    customer = context.watch<User>().user;
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
                color: Color.fromARGB(255, 87, 171, 255),
                // margin: const EdgeInsets.only(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
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
                                "${customer.name}",
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
                      customer: customer,
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
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
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
          FutureBuilder<List<dynamic>>(
            builder: (BuildContext context, snapshot) =>
                snapshot.connectionState == ConnectionState.waiting
                    ? SliverToBoxAdapter(child: LinearProgressIndicator())
                    : snapshot.hasData
                        ? SliverList(
                            delegate: SliverChildBuilderDelegate(
                                (_, index) => VehicleDetailsCard(
                                      vehicle: (snapshot.data
                                          as List<Vehicle>)[index],
                                    ),
                                childCount:
                                    (snapshot.data as List<Vehicle>).length))
                        : const SliverToBoxAdapter(
                            child: Center(
                              child: Text(
                                'No Data Found',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
            future: getDetails(int.parse(customer.id.toString())),
          ),
        ],
      ),
    );
  }
}
