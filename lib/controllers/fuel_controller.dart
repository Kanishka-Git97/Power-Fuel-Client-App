import 'package:power_fuel_client_app/repositories/fuel_service.dart';

import '../models/fuel.dart';

class FuelController {
  final FuelServices services;

  FuelController(this.services);
  Future<Fuel> get(int id) {
    return services.getFuel(id);
  }
}
