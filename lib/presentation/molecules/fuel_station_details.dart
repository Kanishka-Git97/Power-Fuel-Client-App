import 'package:flutter/material.dart';
import 'package:power_fuel_client_app/constants/constants.dart';
import 'package:power_fuel_client_app/controllers/district_controller.dart';
import 'package:power_fuel_client_app/models/customer.dart';
import 'package:power_fuel_client_app/repositories/district_repository.dart';
import 'package:power_fuel_client_app/repositories/gas_station_repository.dart';

import '../../controllers/gas_station_controller.dart';
import '../../models/district.dart';
import '../../models/station.dart';

class FuelStationDetails extends StatefulWidget {
  FuelStationDetails({Key? key, required this.customer}) : super(key: key);
  final Customer customer;

  @override
  State<FuelStationDetails> createState() => _FuelStationDetailsState();
}

class _FuelStationDetailsState extends State<FuelStationDetails> {
  Station station = Station();
  District district = District();

  //Dependency Injection
  var _stationController = GasStationController(GasStationRepository());
  var _districtController = DistrictController(DistrictRepository());

  //Get Details
  Future getDetails(id) async {
    var response = await _stationController.getStation(id);
    setState(() {
      station = response;
    });
    var districtResponse =
        await _districtController.fetchDistrict(station.district);
    setState(() {
      district = districtResponse;
    });
  }

  @override
  void initState() {
    super.initState();

    getDetails(int.parse(widget.customer.station.toString()));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
                color: Color.fromARGB(179, 219, 137, 137),
                blurRadius: 1,
                offset: Offset(2, 2))
          ],
          borderRadius: BorderRadius.circular(10),
          color: const Color(0xffFFAB40)),
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
                  Text(
                    "${station.name}",
                    style: subHeading,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    "${district.district}",
                    style: formTitle,
                  ),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                width: 100,
                height: 100,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: Column(
                  children: const [
                    Icon(
                      Icons.ev_station_sharp,
                      color: primaryColor,
                      size: 30,
                    ),
                    Text(
                      "Petrol",
                      style: subHeading,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "3000L",
                      style: mainHeading,
                    )
                  ],
                ),
              ),
              const SizedBox(
                width: 50,
              ),
              Container(
                padding: const EdgeInsets.all(10),
                width: 100,
                height: 100,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: Column(
                  children: const [
                    Icon(
                      Icons.ev_station_sharp,
                      color: primaryColor,
                      size: 30,
                    ),
                    Text(
                      "Diesel",
                      style: subHeading,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "2500L",
                      style: mainHeading,
                    )
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: const [
              Icon(
                Icons.circle,
                color: Colors.green,
                size: 10,
              ),
              SizedBox(
                width: 3,
              ),
              Text(
                "Next Stock Reciving : ",
                style: normalText,
              ),
              SizedBox(
                width: 3,
              ),
              Text(
                "date ",
                style: normalText,
              )
            ],
          )
        ],
      ),
    );
  }
}
