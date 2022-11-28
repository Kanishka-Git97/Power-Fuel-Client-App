import 'package:power_fuel_client_app/models/customer.dart';
import 'package:http/http.dart' as http;
import '../constants/constants.dart';
import 'dart:convert';

import 'customer_service.dart';

class CustomerRepository implements CustomerServices {
  Future<String> register(Customer customer) async {
    print('${customer.toJson()}');
    var url = Uri.parse('$baseUrl/customers/register');
    var response = await http.post(url,
        headers: {
          "Accept": "application/json",
        },
        body: customer.toJson());
    print(response.statusCode);
    print(response.body);
    return 'true';
  }

  Future<int> validate(Customer customer) async {
    var url = Uri.parse('$baseUrl/customers/validate');
    var response = await http.post(url,
        headers: {
          "Accept": "application/json",
        },
        body: customer.toJson());
    var _response = response.body;
    return int.parse(_response);
  }
}
