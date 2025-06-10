class HomeBannersModel {
  List<Banners>? banners;

  HomeBannersModel({this.banners});

  HomeBannersModel.fromJson(Map<String, dynamic> json) {
    if (json['banners'] != null) {
      banners = <Banners>[];
      json['banners'].forEach((v) {
        banners!.add(Banners.fromJson(v));
      });
    }
  }

}

class Banners {
  int? id;
  String? title;
  String? type;
  String? image;
  String? link;
  String? imageFullUrl;

  Banners(
    {this.id,
      this.title,
      this.type,
      this.image,
      this.link,
      this.imageFullUrl});

  Banners.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    type = json['type'];
    image = json['image'];
    link = json['link'];
    imageFullUrl = json['image_full_url'];
  }
}