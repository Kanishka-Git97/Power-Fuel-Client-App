import '../models/station.dart';

abstract class GasStationServices {
  Future getStationRaw(district);
  Future<Station> getStation(id);
}
