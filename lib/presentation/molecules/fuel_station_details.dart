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
        boxShadow: const [
           BoxShadow(
            color: Color.fromARGB(179, 219, 137, 137),
            blurRadius: 1,
            offset: Offset(2, 2)
          )
        ],
          borderRadius: BorderRadius.circular(10), color: Color(0xffFFAB40)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Super Shead - Karapitiya",
                    style: subHeading,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Galle",
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
                    Icon(Icons.gas_meter, color: primaryColor,size: 30,),
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
                     Icon(Icons.gas_meter, color: primaryColor,size: 30,),
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
          const SizedBox(height: 10,),
          Row(
            children: const [
              Icon(Icons.circle, color: Colors.green, size: 10,),
              SizedBox(width: 3,),
              Text("Next Stock Reciving : ", style: normalText, ),
              SizedBox(width: 3,),
              Text("date ", style: normalText, )
            ],
          )
        ],
      ),
    );
  }
}
