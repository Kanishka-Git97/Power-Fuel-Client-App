class Station {
  int? id;
  String? name;
  String? address;
  String? mobile;
  String? email;
  int? district;
  String? status;
  double? petrolCapacity;
  double? dieselCapacity;

  Station(
      {this.id,
      this.name,
      this.address,
      this.mobile,
      this.email,
      this.district,
      this.status,
      this.petrolCapacity,
      this.dieselCapacity});

  Station.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    address = json['address'];
    mobile = json['mobile'];
    email = json['email'];
    district = json['district'];
    status = json['status'];
    petrolCapacity = json['petrolCapacity'];
    dieselCapacity = json['dieselCapacity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['address'] = this.address;
    data['mobile'] = this.mobile;
    data['email'] = this.email;
    data['district'] = this.district;
    data['status'] = this.status;
    data['petrolCapacity'] = this.petrolCapacity;
    data['dieselCapacity'] = this.dieselCapacity;
    return data;
  }
}
