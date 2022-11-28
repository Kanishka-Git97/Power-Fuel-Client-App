import 'dart:convert';
import '../constants/constants.dart';
import '../models/district.dart';
import 'district_service.dart';
import 'package:http/http.dart' as http;

class DistrictRepository implements DistrictServices {
  //String baseUrl = 'http://localhost:8080';

  // Future<List<District>> getDistricts() async {
  //   List<District> _districts = [];
  //   var url = Uri.parse('$baseUrl/districts/all');
  //   var response = await http.get(url);
  //   print('Status Code: ${response.statusCode}');
  //   var body = json.decode(response.body);
  //   //parse
  //   for (var i = 0; i < body.length; i++) {
  //     _districts.add(District.fromJson(body[i]));
  //   }
  //   return _districts;
  // }

  //Default response of the request
  Future getDistrictsRaw() async {
    var response = await http.get(Uri.parse('$baseUrl/districts/all'),
        headers: {"Accept": "application/json"});
    var jsonBody = response.body;
    var jsonData = json.decode(jsonBody);
    if (response.statusCode != 200) return null;
    List<dynamic> data = [];
    for (var i = 0; i < jsonData.length; i++) {
      data.add(jsonData[i]);
    }
    return data;
  }
}
