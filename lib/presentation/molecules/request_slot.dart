import 'package:flutter/material.dart';
import 'package:power_fuel_client_app/controllers/vehicle_controller.dart';
import 'package:power_fuel_client_app/models/fuel.dart';
import 'package:power_fuel_client_app/repositories/fuel_repository.dart';
import 'package:power_fuel_client_app/repositories/vehicle_repository.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../constants/constants.dart';
import '../../controllers/fuel_controller.dart';
import '../../models/token.dart';
import '../../models/vehicle.dart';
import '../screens/token/qr_view.dart';

class RequestSlot extends StatefulWidget {
  RequestSlot({Key? key, required this.token}) : super(key: key);

  final Token token;

  @override
  State<RequestSlot> createState() => _RequestSlotState();
}

class _RequestSlotState extends State<RequestSlot> {
  //Dependency Injection
  var _vehicleController = VehicleController(VehicleRepository());
  var _fuelController = FuelController(FuelRepository());

  //Variables
  Vehicle vehicle = Vehicle();
  Fuel fuel = Fuel();
  double price = 0.0;

  Future getDetails() async {
    var response = await _vehicleController
        .getVehicle(int.parse(widget.token.vehicle.toString()));

    //Get Fuel
    var fuelresponse =
        await _fuelController.get(int.parse(response.fuelType.toString()));
    var _price = double.parse(widget.token.qty.toString()) *
        double.parse(fuelresponse.price.toString());

    setState(() {
      vehicle = response;
      fuel = fuelresponse;
      price = _price;
    });
  }

  @override
  void initState() {
    super.initState();
    getDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Container(
        width: double.maxFinite,
        height: 130,
        decoration: BoxDecoration(
            border: Border.all(
                color: primaryColor, width: 1, style: BorderStyle.solid),
            borderRadius: const BorderRadius.all(Radius.circular(10))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        if (widget.token.status != "Expired") {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) =>
                                      QRScreen(vehicle: vehicle))));
                        }
                      },
                      child: QrImage(
                        data: '${widget.token.id}',
                        version: QrVersions.auto,
                        size: 50,
                        gapless: false,
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${vehicle.registration}",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          "${widget.token.updateAt}",
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "${widget.token.qty} L",
                      style: TextStyle(fontSize: 25),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Icon(Icons.local_gas_station)
                  ],
                ),
                pay(widget.token.status),
              ],
            ),
            Column(
              children: [
                Container(
                  width: 100,
                  height: 127,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        generateStatus("${widget.token.status}"),
                        Text("${widget.token.status}"),
                      ],
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(10),
                        topRight: Radius.circular(10)),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Icon generateStatus(String status) {
    if (status == "Pending") {
      return Icon(Icons.pending);
    }
    if (status == "Expired") {
      return Icon(Icons.cancel);
    }
    if (status == "Active") {
      return Icon(Icons.done_all_rounded);
    }
    return Icon(Icons.error);
  }

  //Paid Functions
  pay(status) {
    if (status == "Pending") {
      return Padding(
        padding: const EdgeInsets.only(left: 5),
        child: TextButton(
          onPressed: () {
            print("Open Gate");
          },
          style: TextButton.styleFrom(
              backgroundColor:
                  widget.token.status != "Pending" ? Colors.grey : primaryColor,
              minimumSize: const Size(200, 30),
              textStyle: const TextStyle(fontSize: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              side: BorderSide(
                  color: widget.token.status != "Pending"
                      ? Colors.grey
                      : primaryColor)),
          child: Text(
            "Pay LKR $price",
            style: TextStyle(color: Colors.white),
          ),
        ),
      );
    } else {
      return Text("");
    }
  }
}
