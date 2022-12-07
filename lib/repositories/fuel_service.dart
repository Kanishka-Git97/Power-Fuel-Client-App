import '../models/fuel.dart';

abstract class FuelServices {
  Future<Fuel> getFuel(int id);
}
