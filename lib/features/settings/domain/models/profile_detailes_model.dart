class Address {
  final int id;
  final String addressType;
  final String contactPersonName;
  final String contactPersonNumber;
  final String address;
  final String latitude;
  final String longitude;
  final int userId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int zoneId;
  final List<int> zoneIds;
  final String? floor;
  final String? road;
  final String? house;

  Address({
    required this.id,
    required this.addressType,
    required this.contactPersonName,
    required this.contactPersonNumber,
    required this.address,
    required this.latitude,
    required this.longitude,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
    required this.zoneId,
    required this.zoneIds,
    this.floor,
    this.road,
    this.house,
  });

  String get stringId => id.toString();

  String get idString => id.toString();

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      id: json['id'] ?? 0,
      addressType: json['address_type'] ?? '',
      contactPersonName: json['contact_person_name'] ?? '',
      contactPersonNumber: json['contact_person_number'] ?? '',
      address: json['address'] ?? '',
      latitude: (json['latitude'] ?? 0.0),
      longitude: (json['longitude'] ?? 0.0),
      userId: json['user_id'] ?? 0,
      createdAt:
      DateTime.tryParse(json['created_at'] ?? '') ?? DateTime(1970, 1, 1),
      updatedAt:
      DateTime.tryParse(json['updated_at'] ?? '') ?? DateTime(1970, 1, 1),
      zoneId: json['zone_id'] ?? 0,
      zoneIds: (json['zone_ids'] as List?)?.map((e) => e as int).toList() ?? [],
      floor: json['floor'] ?? '',
      road: json['road'] ?? '',
      house: json['house'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      // 'id': id,
      'address_type': addressType,
      'contact_person_name': contactPersonName,
      'contact_person_number': contactPersonNumber,
      'address': address,
      'latitude': latitude,
      'longitude': longitude,
      'user_id': userId,
      // 'created_at': createdAt.toIso8601String(),
      // 'updated_at': updatedAt.toIso8601String(),
      'zone_id': zoneId,
      'zone_ids': zoneIds,
      'floor': floor ?? '',
      'road': road ?? '',
      'house': house ?? '',
    };
  }
}