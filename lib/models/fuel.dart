class Fuel {
  int? id;
  String? type;
  double? price;

  Fuel({this.id, this.type, this.price});

  Fuel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.id != null) {
      data['id'] = this.id;
    }
    data['type'] = this.type;
    data['price'] = this.price;
    return data;
  }
}
