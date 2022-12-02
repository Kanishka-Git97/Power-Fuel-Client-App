import 'package:flutter/material.dart';
import 'package:power_fuel_client_app/controllers/vehicle_controller.dart';
import 'package:power_fuel_client_app/presentation/atoms/custom_icon_button.dart';
import 'package:power_fuel_client_app/presentation/screens/profile_details_screen.dart';
import 'package:power_fuel_client_app/presentation/screens/token/qr_view.dart';
import 'package:power_fuel_client_app/repositories/vehicle_repository.dart';

import '../../constants/constants.dart';
import '../../controllers/token_controller.dart';
import '../../models/vehicle.dart';
import '../../models/vehicle_type.dart';
import '../../repositories/token_repository.dart';
import '../screens/fuel/request_fuel_screen.dart';

class VehicleDetailsCard extends StatefulWidget {
  const VehicleDetailsCard({Key? key, required this.vehicle}) : super(key: key);

  final Vehicle vehicle;

  @override
  State<VehicleDetailsCard> createState() => _VehicleDetailsCardState();
}

class _VehicleDetailsCardState extends State<VehicleDetailsCard> {
  //Dependency Injection
  var _vehicleController = VehicleController(VehicleRepository());
  var _tokenController = TokenController(TokenRepository());

  //Variables
  VehicleType _vehicleType = VehicleType();
  String? _tokenValidation;
  String? _img;

  //Token Validation Checker
  Future tokenValidator() async {
    _tokenValidation = await _tokenController
        .validate(int.parse(widget.vehicle.id.toString()));
  }

  //Notifications
  notification(msg, bool success) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(msg),
        backgroundColor: (success ? Colors.greenAccent : Colors.redAccent),
        action: SnackBarAction(
          label: 'Dismiss',
          onPressed: () {},
        ),
      ),
    );
  }

  //Get Vehicle Type Details
  Future getTypeDetails(int id) async {
    String? img;
    var response = await _vehicleController.getType(id);
    if (response.type == "Bike") {
      img = 'assets/images/Bikesized.png';
    }
    if (response.type == "Car") {
      img = 'assets/images/carsized.png';
    }
    if (response.type == "Bus") {
      img = 'assets/images/Bussized.png';
    }
    if (response.type == "Lorry") {
      img = 'assets/images/Lorrysized.png';
    }
    if (response.type == "Three-Wheel") {
      img = 'assets/images/threewheelsized.png';
    }
    setState(() {
      _vehicleType = response;
      _img = img;
    });
  }

  @override
  void initState() {
    super.initState();
    getTypeDetails(int.parse(widget.vehicle.vehicleType.toString()));
    tokenValidator();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 20),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                  color: primaryColor, width: 1, style: BorderStyle.solid),
              borderRadius: const BorderRadius.all(Radius.circular(10))),
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${widget.vehicle.registration}",
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w700),
                      ),
                      Text("${widget.vehicle.chassis} / ${_vehicleType.type}",
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w300)),
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 70,
                        width: 70,
                        child: (_img == null
                            ? const CircularProgressIndicator()
                            : Image(image: AssetImage('$_img'))),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "${widget.vehicle.availableQuota} L",
                    style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "/ ${_vehicleType.quota} L",
                    style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [

                  Stack(
                    children: [

                      CustomIconButton(
                    customIcon: Icons.qr_code,
                    onTapButton: () {
                      print(_tokenValidation);
                      if (_tokenValidation != "0") {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) =>
                                    QRScreen(vehicle: widget.vehicle))));
                      } else {
                        notification("Please Request Quota For the QR", false);
                      }
                    },
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Icon(Icons.circle, 
                    size: 12, 
                    color: _tokenValidation != "0" ? Colors.green : secondaryColor,),)
                    ],
                  ),
                  CustomIconButton(
                    customIcon: Icons.add,
                    onTapButton: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RequestFuelScreen(
                            vehicle: widget.vehicle,
                            type: _vehicleType,
                          ),
                        ),
                      );
                    },
                  ),
                  CustomIconButton(
                    customIcon: Icons.edit,
                    onTapButton: () {},
                  ),
                  CustomIconButton(
                    customIcon: Icons.delete,
                    onTapButton: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
