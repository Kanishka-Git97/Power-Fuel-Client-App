class Customer {
  int? id;
  String? name;
  String? address;
  String? nic;
  String? email;
  String? password;
  int? district;
  int? station;

  Customer(
      {this.id,
      this.name,
      this.address,
      this.nic,
      this.email,
      this.password,
      this.district,
      this.station});

  Customer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    address = json['address'];
    nic = json['nic'];
    email = json['email'];
    password = json['password'];
    district = json['district'];
    station = json['station'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.id != null) {
      data['id'] = this.id.toString();
    }
    data['name'] = this.name == null ? null : this.name.toString();
    data['address'] = this.address == null ? null : this.address.toString();
    data['nic'] = this.nic == null ? null : this.nic.toString();
    data['email'] = this.email == null ? null : this.email.toString();
    data['password'] = this.password == null ? null : this.password.toString();
    data['district'] = this.district == null ? null : this.district.toString();
    data['station'] = this.station == null ? null : this.station.toString();
    ;
    return data;
  }
}
