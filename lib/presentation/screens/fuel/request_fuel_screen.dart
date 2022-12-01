import 'package:flutter/material.dart';
import 'package:power_fuel_client_app/controllers/token_controller.dart';
import 'package:power_fuel_client_app/models/customer.dart';
import 'package:power_fuel_client_app/models/token.dart';
import 'package:power_fuel_client_app/models/vehicle.dart';
import 'package:power_fuel_client_app/models/vehicle_type.dart';
import 'package:power_fuel_client_app/presentation/atoms/text_input.dart';
import 'package:power_fuel_client_app/repositories/token_repository.dart';
import 'package:provider/provider.dart';
import '../../../constants/constants.dart';
import '../../../presentation/molecules/custom_bottom_navigation.dart';
import '../../../providers/user_provider.dart';
import '../../atoms/navigation_button.dart';

class RequestFuelScreen extends StatefulWidget {
  const RequestFuelScreen({Key? key, required this.vehicle, required this.type})
      : super(key: key);

  final Vehicle vehicle;
  final VehicleType type;

  @override
  State<RequestFuelScreen> createState() => _RequestFuelScreenState();
}

class _RequestFuelScreenState extends State<RequestFuelScreen> {
  //Dependency Injection
  var _tokenController = TokenController(TokenRepository());

  //Text Editing Controller
  final _requestController = new TextEditingController();

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

  //Request
  Future request() async {
    //Front End Validation
    if (_requestController.value.text.isEmpty ||
        int.parse(_requestController.value.text) == 0) {
      return notification("Enter Valid Request Amount", false);
    }
    if (double.parse(_requestController.value.text) >
        double.parse(widget.vehicle.availableQuota.toString())) {
      return notification("Can't be Exceed Available Quota", false);
    }
    Token token = Token();
    token.vehicle = widget.vehicle.id;
    token.qty = double.parse(_requestController.text);
    token.requestedAt = DateTime.now().toString();
    token.status = "Pending";
    var response = await _tokenController.add(token);
    if (response == "true")
      return notification("Token Requested Successfully", true);
  }

  @override
  Widget build(BuildContext context) {
    Customer _user = context.watch<User>().user;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        leading: const NavigationButton(),
        title: const Text(
          "Add Fuel Request",
          style: mainHeading,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: SizedBox(
            width: double.maxFinite,
            height: 300,
            child: Card(
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
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
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500),
                            ),
                            Text(
                                "${widget.vehicle.chassis} / ${widget.type.type}",
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w300)),
                          ],
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  "${widget.vehicle.availableQuota} L",
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text("/ ${widget.type.quota} L",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold))
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.local_gas_station,
                          color: primaryColor,
                          size: 35,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextInput(
                      hintText: "Add Quantity",
                      labelText: "Request Quantity",
                      keyboardType: TextInputType.number,
                      controller: _requestController,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        OutlinedButton(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                              minimumSize: const Size(120, 50),
                              textStyle: const TextStyle(fontSize: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              side: const BorderSide(color: primaryColor)),
                          child: const Text(
                            "Cancle",
                            style: TextStyle(color: primaryColor),
                          ),
                        ),
                        TextButton(
                          onPressed: request,
                          style: OutlinedButton.styleFrom(
                            backgroundColor: primaryColor,
                            minimumSize: const Size(120, 50),
                            textStyle: const TextStyle(fontSize: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: Text(
                            "Confrim",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(index: 2),
    );
  }
}
