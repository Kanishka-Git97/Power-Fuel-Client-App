import 'package:flutter/material.dart';
import 'package:power_fuel_client_app/constants/constants.dart';
import 'package:power_fuel_client_app/presentation/atoms/primary_button.dart';

class FuelPurchaseDetails extends StatelessWidget {
  const FuelPurchaseDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 112,
      // margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      // decoration: BoxDecoration(
      //   color: Colors.white,
      //   border:
      //       Border.all(color: primaryColor, width: 1, style: BorderStyle.solid),
      //   borderRadius: const BorderRadius.all(Radius.circular(10)),
      // ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Text(
                    "BHV-2794",
                    style: subHeading,
                  ),
                  SizedBox(height: 5,),
                  Text("2022-11-20", style: formTitle,)
                ],
              ),
              const SizedBox(width: 30,),
              Container(
                width: 80,
                height: 80,
                color: Colors.green,
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 30),
                  child: Text("Pending", style: normalTextLight,textAlign: TextAlign.center,),
                ),
              ),
            ],
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.end,
          //   children: [
          //     Padding(
          //       padding: const EdgeInsets.only(right: 20),
          //       child:OutlinedButton(
          //                 onPressed: () {},
          //                 style: OutlinedButton.styleFrom(
          //                     minimumSize: const Size(100, 30),
          //                     textStyle: const TextStyle(fontSize: 16),
          //                     shape: RoundedRectangleBorder(
          //                       borderRadius: BorderRadius.circular(12),
          //                     ),
          //                     side: const BorderSide(color: primaryColor)),
          //                 child: const Text(
          //                   "Pay",
          //                   style: TextStyle(color: primaryColor),
          //                 ),
          //               ),
          //     )
          //   ],
          // )
        ],
      ),
    );
  }
}
