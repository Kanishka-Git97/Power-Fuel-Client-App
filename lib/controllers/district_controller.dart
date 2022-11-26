import 'package:power_fuel_client_app/repositories/district_service.dart';

import '../models/district.dart';

class DistrictController {
  final DistrictServices services;

  DistrictController(this.services);
  Future<List<District>> fetchDistricts() async {
    return services.getDistricts();
  }
}
