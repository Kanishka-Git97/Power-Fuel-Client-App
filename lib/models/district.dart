class District {
  int? id;
  String? district;

  District({this.id, this.district});

  District.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    district = json['district'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['district'] = this.district;
    return data;
  }
}
