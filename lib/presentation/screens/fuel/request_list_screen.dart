import 'package:flutter/material.dart';
import 'package:power_fuel_client_app/models/token.dart';

import 'package:power_fuel_client_app/presentation/molecules/custom_bottom_navigation.dart';
import 'package:power_fuel_client_app/presentation/molecules/fuel_purchase_details.dart';
import 'package:power_fuel_client_app/presentation/molecules/request_slot.dart';
import 'package:provider/provider.dart';

import '../../../constants/constants.dart';
import '../../../controllers/token_controller.dart';
import '../../../models/customer.dart';
import '../../../providers/user_provider.dart';
import '../../../repositories/token_repository.dart';
import '../../atoms/navigation_button.dart';

class RequestListScreen extends StatefulWidget {
  RequestListScreen({Key? key}) : super(key: key);

  @override
  State<RequestListScreen> createState() => _RequestListScreenState();
}

class _RequestListScreenState extends State<RequestListScreen> {
  //Dependency Injection
  var _tokenController = TokenController(TokenRepository());

  //Variables
  Customer customer = Customer();
  List<Token> list = [];

  //GetDetails
  Future<List<Token>> getDetails(int id) async {
    var response = await _tokenController.fetchTokens(id);
    return response;
  }

  @override
  Widget build(BuildContext context) {
    //Provider Callback
    customer = context.watch<User>().user;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white30,
        elevation: 0,
        leading: const NavigationButton(),
        title: Text(
          " Fuel Request List",
          style: mainHeading,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder(
          future: getDetails(int.parse(customer.id.toString())),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Container(
                child: ListView.builder(
                  itemBuilder: (BuildContext context, index) {
                    return RequestSlot(
                      token: (snapshot.data as List<Token>)[index],
                    );
                  },
                  itemCount: (snapshot.data as List<Token>).length,
                ),
              );
            }
            return CircularProgressIndicator();
          },
        ),
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(index: 2),
    );
  }
}
