import 'package:power_fuel_client_app/models/vehicle_type.dart';
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

  Future<List<Vehicle>> fetchVehicles(int id) {
    return services.getVehicles(id);
  }

  Future<VehicleType> getType(int id) {
    return services.getType(id);
  }

  Future<Vehicle> getVehicle(int id) {
    return services.getVehicle(id);
  }
}
