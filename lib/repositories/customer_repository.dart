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

  @override
  Future<Customer> login(String email, String password) async {
    var url = Uri.parse('$baseUrl/customers/login');
    var response = await http.post(url,
        headers: {"Accept": "application/json"},
        body: {"email": '$email', "password": '$password'});
    print(response.contentLength);
    if (response.statusCode == 200) {
      if (response.contentLength! > 0) {
        var body = json.decode(response.body);
        return Customer.fromJson(body);
      }
      return Customer();
    }
    return Customer();
  }
}
