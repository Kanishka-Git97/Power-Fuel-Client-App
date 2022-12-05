import 'package:flutter/material.dart';
import 'package:power_fuel_client_app/constants/constants.dart';

class FuelPurchaseDetails extends StatelessWidget {
  const FuelPurchaseDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 112,
      decoration: BoxDecoration(
        color: Colors.white,
        border:
            Border.all(color: primaryColor, width: 1, style: BorderStyle.solid),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Text(
                          "BHV-2794",
                          style: subHeading,
                        ),
                      ),
                      SizedBox(
                    width: 20,
                  ),
                  Text(
                    "2022-11-20",
                    style: formTitle,
                  ),
                    ],
                  ),
                  const SizedBox(height: 5,),
                  Row(
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Text(
                          "4L",
                          style: subHeading,
                        ),
                      ),
                      SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Rs. 1500",
                    style: formTitle,
                  ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child:TextButton(
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                backgroundColor: primaryColor,
                                  minimumSize: const Size(200, 30),
                                  textStyle: const TextStyle(fontSize: 16),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  side: const BorderSide(color: primaryColor)),
                              child: const Text(
                                "Pay",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                  ) 
                ],
              ),
              Container(
                width: 80,
                height: 110,
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 45),
                  child: Text(
                    "Pending",
                    style: normalTextLight,
                    textAlign: TextAlign.center,
                  ),
                ),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  color: Colors.green,
                ),
              ),
            ],
          ), 
          
        ], 
      ),
    );
  }
}
