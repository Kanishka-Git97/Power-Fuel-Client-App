import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../../../models/vehicle.dart';
import '../../../presentation/atoms/navigation_button.dart';
import '../../../repositories/token_repository.dart';


import '../../../constants/constants.dart';
import '../../../controllers/token_controller.dart';
import '../../../models/token.dart';

class QRScreen extends StatefulWidget {
  const QRScreen({Key? key, required this.vehicle}) : super(key: key);
  final Vehicle vehicle;

  @override
  State<QRScreen> createState() => _QRScreenState();
}

class _QRScreenState extends State<QRScreen> {
  //Dependency Injection
  var _tokenController = TokenController(TokenRepository());

  //Variables
  Token token = Token();

  //Details Loading
  Future loadDetails() async {
    var response = await _tokenController
        .getToken(int.parse(widget.vehicle.id.toString()));
    setState(() {
      token = response;
    });
  }

  @override
  void initState() {
    super.initState();
    loadDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white30,
        elevation: 0,
        leading: const NavigationButton(),
        title: Text("Token",style: mainHeading,),
      ),
      body: Container(
        color:  Colors.white30,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "${widget.vehicle.registration}",
                  style:
                      const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                QrImage(
                  data: '${token.id}',
                  version: QrVersions.auto,
                  size: 320,
                  gapless: false,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                        height: 20,
                        width: 20,
                        child: CircleAvatar(
                          backgroundColor: token.status == "Pending"
                              ? Colors.orangeAccent
                              : Colors.greenAccent,
                        )),
                    const SizedBox(
                      width: 10,
                    ),
                    Text("${token.status}"),
                    const SizedBox(
                      height: 40,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "${token.qty} L",
                      style: TextStyle(
                          color: Colors.grey.shade800,
                          fontSize: 50,
                          fontWeight: FontWeight.bold),
                    ),
                    Icon(
                      Icons.local_gas_station,
                      color: Colors.grey.shade800,
                      size: 50,
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
