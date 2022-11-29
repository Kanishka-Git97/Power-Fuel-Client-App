import 'package:power_fuel_client_app/models/station.dart';
import 'package:power_fuel_client_app/repositories/gas_station_service.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../constants/constants.dart';

class GasStationRepository implements GasStationServices {
  //Default response of request
  @override
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

  @override
  Future<Station> getStation(id) async {
    var data = {"id": id};
    var url = Uri.parse('$baseUrl/fuelstation/get');
    var response = await http.post(url,
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json"
        },
        body: jsonEncode(data));
    print(response.statusCode);
    if (response.statusCode == 200) {
      return Station.fromJson(json.decode(response.body));
    }
    return Station();
  }
}
