class UserDetailResponse {
  int? id;
  String? fullName;

  UserDetailResponse({this.id, this.fullName});

  UserDetailResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['fullName'];
  }
}
