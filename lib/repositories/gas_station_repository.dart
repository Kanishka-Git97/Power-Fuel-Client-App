import 'package:power_fuel_client_app/repositories/gas_station_service.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../constants/constants.dart';

class GasStationRepository implements GasStationServices {
  //Default response of request
  Future getStationRaw(district) async {
    var response =
        await http.post(Uri.parse('$baseUrl/fuelstation/nearest'), body: {
      "id": "$district"
    }, headers: {
      "Accept": "application/json",
    });
    var jsonBody = response.body;
    var jsonData = json.decode(jsonBody);
    if (response.statusCode != 200) return [];
    List<dynamic> data = [];
    for (var i = 0; i < jsonData.length; i++) {
      data.add(jsonData[i]);
    }

    return data;
  }
}
