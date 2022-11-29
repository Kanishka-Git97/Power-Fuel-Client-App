import 'package:power_fuel_client_app/repositories/vehicle_service.dart';

import '../models/vehicle.dart';

class VehicleController {
  final VehicleServices services;

  VehicleController(this.services);
  Future fetchVehicleTypes() {
    return services.getVehicleTypesRaw();
  }

  Future fetchFuelTypes() {
    return services.getFuelTypesRaw();
  }

  Future<String> save(Vehicle vehicle) {
    return services.register(vehicle);
  }
}
