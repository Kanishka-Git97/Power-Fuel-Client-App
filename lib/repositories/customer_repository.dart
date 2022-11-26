import 'package:power_fuel_client_app/models/customer.dart';
import 'package:http/http.dart' as http;

import 'customer_service.dart';

class CustomerRepository implements CustomerServices {
  String baseUrl = 'http://localhost:8080';
  Future<String> register(Customer customer) async {
    var url = Uri.parse('$baseUrl/customers/register');
    var response = await http.post(url, body: customer.toJson());
    print(response.statusCode);
    print(response.body);
    return 'true';
  }
}
