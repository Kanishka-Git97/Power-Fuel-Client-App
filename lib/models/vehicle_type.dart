class District {
  int? id;
  String? type;

  District({this.id, this.type});

  District.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['district'] = this.type;
    return data;
  }
  }