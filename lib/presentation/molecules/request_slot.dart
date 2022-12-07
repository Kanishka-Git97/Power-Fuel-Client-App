import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../constants/constants.dart';

class RequestSlot extends StatelessWidget {
  const RequestSlot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  QrImage(
                    data: 'Test',
                    version: QrVersions.auto,
                    size: 50,
                    gapless: false,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "BHV-2794",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        "2022-11-20",
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
                    "4.0 L",
                    style: TextStyle(fontSize: 25),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Icon(Icons.local_gas_station)
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: TextButton(
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
                    "Pay LKR 3450.00",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )
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
                      Icon(Icons.pending),
                      Text("Pending"),
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
    );
  }
}
