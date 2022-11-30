import 'package:power_fuel_client_app/repositories/gas_station_service.dart';

class GasStationController {
  final GasStationServices services;

  GasStationController(this.services);
  Future fetchGasStationRaw(district) async {
    return services.getStationRaw(district);
  }

  Future getStation(id) {
    return services.getStation(id);
  }
}
