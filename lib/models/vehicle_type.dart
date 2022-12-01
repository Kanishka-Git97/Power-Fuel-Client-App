class VehicleType {
  int? id;
  String? type;
  double? quota;

  VehicleType({this.id, this.type, this.quota});

  VehicleType.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    quota = json['quota'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.id != null) {
      data['id'] = this.id;
    }
    data['type'] = this.type;
    data['quota'] = this.quota;
    return data;
  }
}
