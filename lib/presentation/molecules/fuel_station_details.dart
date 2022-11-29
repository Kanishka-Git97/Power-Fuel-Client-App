import 'package:flutter/material.dart';
import 'package:power_fuel_client_app/constants/constants.dart';

class FuelStationDetails extends StatelessWidget {
  const FuelStationDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: primaryColor),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Super Shead - Karapitiya",
            style: subHeading,
          ),
          const SizedBox(
            height: 5,
          ),
          const Text(
            "Galle",
            style: formTitle,
          ),
          const SizedBox(
            height: 20,
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
                    Text("Available Petrol Quantity", style: normalText, textAlign: TextAlign.center,),
                    SizedBox(height: 5,),
                    Text("3000L", style: mainHeading,)
                  ],
                ),
              ),
              const SizedBox(width: 50,),
              Container(
                padding:const  EdgeInsets.all(10),
                width: 100,
                height: 100,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: Column(
                  children: const[
                    Text("Available Diesel Quantity", style: normalText, textAlign: TextAlign.center,),
                    SizedBox(height: 5,),
                    Text("2500L", style: mainHeading,)
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
