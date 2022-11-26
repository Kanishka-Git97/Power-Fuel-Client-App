class Customer {
  int? id;
  String? name;
  String? address;
  String? nic;
  String? mobile;
  String? email;
  String? password;
  int? district;
  int? station;

  Customer(
      {this.id,
      this.name,
      this.address,
      this.nic,
      this.mobile,
      this.email,
      this.password,
      this.district,
      this.station});

  Customer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    address = json['address'];
    nic = json['nic'];
    mobile = json['mobile'];
    email = json['email'];
    password = json['password'];
    district = json['district'];
    station = json['station'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['address'] = this.address;
    data['nic'] = this.nic;
    data['mobile'] = this.mobile;
    data['email'] = this.email;
    data['password'] = this.password;
    data['district'] = this.district;
    data['station'] = this.station;
    return data;
  }
}
