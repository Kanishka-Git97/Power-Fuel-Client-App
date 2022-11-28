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
    id = json['id'] == null ? null : int.tryParse(json['id']);
    name = json['name'] == null ? null : json['name'].toString();
    address = json['address'] == null ? null : json['address'].toString();
    nic = json['nic'] == null ? null : json['nic'].toString();
    email = json['email'] == null ? null : json['email'].toString();
    password = json['password'] == null ? null : json['password'].toString();
    district = json['district'] == null ? null : int.tryParse(json['district']);
    station = json['station'] == null ? null : int.tryParse(json['station']);
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
