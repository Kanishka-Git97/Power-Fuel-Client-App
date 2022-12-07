import 'package:power_fuel_client_app/repositories/fuel_service.dart';
import 'package:http/http.dart' as http;
import '../constants/constants.dart';
import '../models/fuel.dart';
import 'dart:convert';

class FuelRepository implements FuelServices {
  @override
  Future<Fuel> getFuel(int id) async {
    var data = {"id": id};
    var url = Uri.parse('$baseUrl/fueltype/get');
    var response = await http.post(url,
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json"
        },
        body: jsonEncode(data));
    if (response.statusCode == 200) {
      print(response.body);
      return Fuel.fromJson(json.decode(response.body));
    }
    return Fuel();
  }
}
