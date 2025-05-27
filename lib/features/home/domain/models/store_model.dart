class StoreModel {
  final int id;
  final String name;
  final String phone;
  final String email;
  final String logoUrl;
  final String logo;
  final String coverPhotoUrl;
  final String address;
  final bool delivery;
  final bool takeAway;
  final String deliveryTime;
  final bool open;
  final List<int> categoryIds;

  StoreModel({
    required this.id,
    required this.name,
    required this.phone,
    required this.email,
    required this.logoUrl,
    required this.logo,
    required this.coverPhotoUrl,
    required this.address,
    required this.delivery,
    required this.takeAway,
    required this.deliveryTime,
    required this.open,
    required this.categoryIds,
  });

  factory StoreModel.fromJson(Map<String, dynamic> json) {
    return StoreModel(
      id: json['id'],
      name: json['name'],
      phone: json['phone'],
      email: json['email'],
      logoUrl: json['logo_full_url'] ?? '',
      logo: json['logo'] ?? '',
      coverPhotoUrl: json['cover_photo_full_url'] ?? '',
      address: json['address'],
      delivery: json['delivery'] ?? false,
      takeAway: json['take_away'] ?? false,
      deliveryTime: json['delivery_time'] ?? '',
      open: json['open'] == 1,
      categoryIds: (json['category_ids'] as List<dynamic>?)
              ?.map((e) => int.tryParse(e.toString()) ?? 0)
              .toList() ??
          [],
    );
  }
}
