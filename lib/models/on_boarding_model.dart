class OnBoardingModel {
  String? image;
  String? description;
  String? id;
  String? title;
  String? subTitle;

  OnBoardingModel({
    this.image,
    this.description,
    this.id,
    this.title,
    this.subTitle,
  });

  OnBoardingModel.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    id = json['id'];
    title = json['title'];
    description = json['description'];
    subTitle = json['subTitle'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['image'] = image;
    data['description'] = description;
    data['id'] = id;
    data['title'] = title;
    data['subTitle'] = subTitle;
    return data;
  }
}
