class Vehicle {
  int? id;
  String? registration;
  String? chassis;
  int? availableQuota;
  int? vehicleType;
  int? fuelType;

  Vehicle(
      {this.id,
      this.registration,
      this.chassis,
      this.availableQuota,
      this.vehicleType,
      this.fuelType});

  Vehicle.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    registration = json['registration'];
    chassis = json['chassis'];
    availableQuota = json['availableQuota'];
    vehicleType = json['vehicleType'];
    fuelType = json['fuelType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.id != null) {
      data['id'] = this.id;
    }
    data['registration'] = this.registration;
    data['chassis'] = this.chassis;
    if (this.availableQuota != null) {
      data['availableQuota'] = this.availableQuota;
    }
    data['vehicleType'] = this.vehicleType;
    data['fuelType'] = this.fuelType;
    return data;
  }
}
