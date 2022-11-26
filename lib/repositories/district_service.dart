import '../models/district.dart';

abstract class DistrictServices {
  Future<List<District>> getDistricts();
}
