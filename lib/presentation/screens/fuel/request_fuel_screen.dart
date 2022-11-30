import 'package:flutter/material.dart';
import 'package:power_fuel_client_app/presentation/atoms/text_input.dart';
import '../../../constants/constants.dart';
import '../../../presentation/molecules/custom_bottom_navigation.dart';
import '../../atoms/navigation_button.dart';

class RequestFuelScreen extends StatelessWidget {
  const RequestFuelScreen(
      {Key? key,
      required this.regiNo,
      required this.vehicleType,
      required this.availableQty})
      : super(key: key);

  final String regiNo;
  final String vehicleType;
  final String availableQty;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        leading: const NavigationButton(),
        title: const Text(
          "Add Fuel Request",
          style: mainHeading,
        ),
      ),
      body: Padding(
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
                    children: [
                      const Text(
                        "Vehicle Registration Number : ",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "    " + regiNo,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      const Text(
                        "Vehicle Type : ",
                        style: normalText,
                      ),
                      Text(
                        "    " + vehicleType,
                        style: normalText,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      const Text(
                        "Available Quantity : ",
                        style: normalText,
                      ),
                      Text(
                        "    " + availableQty,
                        style: normalText,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const TextInput(
                      hintText: "Add Quantity",
                      labelText: "Request Quantity",
                      keyboardType: TextInputType.text),
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
                          side:const  BorderSide(color: primaryColor)
                        ),
                        child: const Text(
                          "Cancle",
                          style: TextStyle(color: primaryColor),
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
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
      bottomNavigationBar: const CustomBottomNavigationBar(index: 2),
    );
  }
}
