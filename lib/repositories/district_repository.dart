import 'dart:convert';

import '../models/district.dart';
import 'district_service.dart';
import 'package:http/http.dart' as http;

class DistrictRepository implements DistrictServices {
  String baseUrl = 'http://localhost:8080';

  Future<List<District>> getDistricts() async {
    List<District> _districts = [];
    var url = Uri.parse('$baseUrl/districts/all');
    var response = await http.get(url);
    print('Status Code: ${response.statusCode}');
    var body = json.decode(response.body);
    //parse
    for (var i = 0; i < body.length; i++) {
      _districts.add(District.fromJson(body[i]));
    }
    return _districts;
  }
}
