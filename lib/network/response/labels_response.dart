class LabelsResponse {
  String? name;
  int? catId;
  int? id;

  LabelsResponse({this.name, this.catId, this.id});

  LabelsResponse.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    catId = json['catId'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['catId'] = this.catId;
    data['id'] = this.id;
    return data;
  }
}
