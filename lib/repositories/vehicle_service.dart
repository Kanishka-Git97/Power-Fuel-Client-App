import 'package:power_fuel_client_app/models/vehicle.dart';
import '../models/vehicle_type.dart';

abstract class VehicleServices {
  Future getVehicleTypesRaw();
  Future getFuelTypesRaw();
  Future<String> register(Vehicle vehicle);
  Future<List<Vehicle>> getVehicles(int id);
  Future<VehicleType> getType(int id);
  Future<Vehicle> getVehicle(int id);
}
