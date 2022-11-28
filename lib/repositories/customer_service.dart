import 'package:power_fuel_client_app/models/customer.dart';

abstract class CustomerServices {
  Future<String> register(Customer customer);
  Future<int> validate(Customer customer);
}
