class ItemsResponse {
  String? image;
  String? title;
  bool? isFavorite;
  bool? isBookmarked;
  int? labelId;
  int? catId;
  int? id;

  ItemsResponse(
      {this.image,
      this.title,
      this.isFavorite,
      this.isBookmarked,
      this.labelId,
      this.catId,
      this.id});

  ItemsResponse.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    title = json['title'];
    isFavorite = json['isFavorite'];
    isBookmarked = json['isBookmarked'];
    labelId = json['labelId'];
    catId = json['catId'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['title'] = this.title;
    data['isFavorite'] = this.isFavorite;
    data['isBookmarked'] = this.isBookmarked;
    data['labelId'] = this.labelId;
    data['catId'] = this.catId;
    data['id'] = this.id;
    return data;
  }
}
