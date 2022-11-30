import 'package:flutter/material.dart';
import 'package:power_fuel_client_app/models/customer.dart';

class User with ChangeNotifier {
  Customer _user = Customer();
  Customer get user => _user;
  void setUser(Customer customer) {
    _user = customer;
    notifyListeners();
  }
}
