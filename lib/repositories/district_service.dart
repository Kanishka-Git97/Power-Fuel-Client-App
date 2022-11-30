import '../models/district.dart';

abstract class DistrictServices {
  //Future<List<District>> getDistricts();
  Future getDistrictsRaw();
  Future<District> getDistrict(id);
}
