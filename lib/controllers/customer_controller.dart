import 'package:power_fuel_client_app/repositories/customer_service.dart';

import '../models/customer.dart';

class CustomerController {
  final CustomerServices services;

  CustomerController(this.services);
  Future<String> register(Customer customer) {
    return services.register(customer);
  }

  Future<int> validate(Customer customer) {
    return services.validate(customer);
  }
}
