import 'package:power_fuel_client_app/constants/constants.dart';
import 'package:power_fuel_client_app/models/vehicle.dart';
import 'package:power_fuel_client_app/repositories/vehicle_service.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/vehicle_type.dart';

class VehicleRepository implements VehicleServices {
  Future getVehicleTypesRaw() async {
    var response = await http.get(Uri.parse('$baseUrl/vehicletype/all'),
        headers: {"Accept": "application/json"});
    var jsonBody = response.body;
    print(response.statusCode);
    if (response.statusCode != 200) return null;
    var jsonData = json.decode(jsonBody);
    List<dynamic> data = [];
    for (var i = 0; i < jsonData.length; i++) {
      data.add(jsonData[i]);
    }
    return data;
  }

  Future getFuelTypesRaw() async {
    var response = await http.get(Uri.parse('$baseUrl/fueltype/all'),
        headers: {"Accept": "application/json"});
    var jsonBody = response.body;
    if (response.statusCode != 200) return null;
    var jsonData = json.decode(jsonBody);
    List<dynamic> data = [];
    for (var i = 0; i < jsonData.length; i++) {
      data.add(jsonData[i]);
    }
    return data;
  }

  Future<String> register(Vehicle vehicle) async {
    print('${vehicle.toJson()}');
    var url = Uri.parse('$baseUrl/vehicle/add');
    var response = await http.post(url,
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json"
        },
        body: jsonEncode(vehicle.toJson()));
    print(response.statusCode);
    if (response.body == 'Duplicate') return 'Duplicate';
    return 'Save';
  }

  Future<List<Vehicle>> getVehicles(int id) async {
    var data = {"id": id};
    var url = Uri.parse('$baseUrl/vehicle/vehicles');
    var response = await http.post(url,
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json"
        },
        body: jsonEncode(data));
    print(response.statusCode);
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      List<Vehicle> data = [];
      for (var i = 0; i < jsonData.length; i++) {
        data.add(Vehicle.fromJson(jsonData[i]));
      }
      return data;
    }
    return [];
  }

  @override
  Future<VehicleType> getType(int id) async {
    var data = {"id": id};
    var url = Uri.parse('$baseUrl/vehicletype/get');
    var response = await http.post(url,
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json"
        },
        body: jsonEncode(data));
    if (response.statusCode == 200) {
      return VehicleType.fromJson(json.decode(response.body));
    }
    return VehicleType();
  }

  @override
  Future<Vehicle> getVehicle(int id) async {
    var data = {"id": id};
    var url = Uri.parse('$baseUrl/vehicle/get');
    var response = await http.post(url,
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json"
        },
        body: jsonEncode(data));
    if (response.statusCode == 200) {
      return Vehicle.fromJson(json.decode(response.body));
    }
    return Vehicle();
  }
}
