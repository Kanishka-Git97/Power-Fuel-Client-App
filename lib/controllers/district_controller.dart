import 'package:power_fuel_client_app/repositories/district_service.dart';

import '../models/district.dart';

class DistrictController {
  final DistrictServices services;

  DistrictController(this.services);
  Future fetchDistrictsRaw() async {
    return services.getDistrictsRaw();
  }

  Future<District> fetchDistrict(id) async {
    return services.getDistrict(id);
  }
}
