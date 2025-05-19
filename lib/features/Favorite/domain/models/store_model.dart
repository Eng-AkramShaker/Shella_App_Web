class Store {
  int? id;
  String? name;
  String? logo;
  String? cover;
  String? address;
  double? rating;

  Store({
    this.id,
    this.name,
    this.logo,
    this.cover,
    this.address,
    this.rating,
  });

  Store.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    logo = json['logo'];
    cover = json['cover'];
    address = json['address'];

    // Handle different numeric types
    if (json['rating'] != null) {
      rating = (json['rating'] is int)
          ? (json['rating'] as int).toDouble()
          : json['rating']?.toDouble();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (id != null) data['id'] = id;
    if (name != null) data['name'] = name;
    if (logo != null) data['logo'] = logo;
    if (cover != null) data['cover'] = cover;
    if (address != null) data['address'] = address;
    if (rating != null) data['rating'] = rating;
    return data;
  }
}
