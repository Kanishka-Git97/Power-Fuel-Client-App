import 'package:power_fuel_client_app/models/vehicle.dart';

abstract class VehicleServices {
  Future getVehicleTypesRaw();
  Future getFuelTypesRaw();
  Future<String> register(Vehicle vehicle);
}
