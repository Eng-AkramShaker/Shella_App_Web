class AddressModel {
  int? totalSize;
  int? limit;
  int? offset;
  List<Addresses>? addresses;

  AddressModel({this.totalSize, this.limit, this.offset, this.addresses});

  AddressModel.fromJson(Map<String, dynamic> json) {
    totalSize = json['total_size'];
    limit = json['limit'];
    offset = json['offset'];
    if (json['addresses'] != null) {
      addresses = <Addresses>[];
      json['addresses'].forEach((v) {
        addresses!.add(new Addresses.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total_size'] = this.totalSize;
    data['limit'] = this.limit;
    data['offset'] = this.offset;
    if (this.addresses != null) {
      data['addresses'] = this.addresses!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Addresses {
  int? id;
  String? addressType;
  String? contactPersonNumber;
  String? address;
  String? latitude;
  String? longitude;
  int? userId;
  String? contactPersonName;
  String? createdAt;
  String? updatedAt;
  int? zoneId;
  Null? floor;
  Null? road;
  Null? house;
  List<int>? zoneIds;

  Addresses(
      {this.id,
        this.addressType,
        this.contactPersonNumber,
        this.address,
        this.latitude,
        this.longitude,
        this.userId,
        this.contactPersonName,
        this.createdAt,
        this.updatedAt,
        this.zoneId,
        this.floor,
        this.road,
        this.house,
        this.zoneIds});

  Addresses.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    addressType = json['address_type'];
    contactPersonNumber = json['contact_person_number'];
    address = json['address'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    userId = json['user_id'];
    contactPersonName = json['contact_person_name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    zoneId = json['zone_id'];
    floor = json['floor'];
    road = json['road'];
    house = json['house'];
    zoneIds = json['zone_ids'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['address_type'] = this.addressType;
    data['contact_person_number'] = this.contactPersonNumber;
    data['address'] = this.address;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['user_id'] = this.userId;
    data['contact_person_name'] = this.contactPersonName;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['zone_id'] = this.zoneId;
    data['floor'] = this.floor;
    data['road'] = this.road;
    data['house'] = this.house;
    data['zone_ids'] = this.zoneIds;
    return data;
  }
}