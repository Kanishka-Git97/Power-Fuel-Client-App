class Token {
  int? id;
  int? vehicle;
  double? qty;
  String? requestedAt;
  String? status;
  String? updateAt;

  Token(
      {this.id,
      this.vehicle,
      this.qty,
      this.requestedAt,
      this.status,
      this.updateAt});

  Token.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    vehicle = json['vehicle'];
    qty = json['qty'];
    requestedAt = json['requestedAt'];
    status = json['status'];
    updateAt = json['updateAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['vehicle'] = this.vehicle;
    data['qty'] = this.qty;
    data['requestedAt'] = this.requestedAt;
    data['status'] = this.status;
    data['updateAt'] = this.updateAt;
    return data;
  }
}
