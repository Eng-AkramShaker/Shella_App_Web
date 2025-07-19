
import 'package:shella_design/common/util/app_images.dart';

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
  final double? distance;
  final String? currentOpeningTime;
  final double? deliveryFeeTax;
  final Module? module;

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
    required this.distance,
    required this.currentOpeningTime,
    required this.deliveryFeeTax,
    required this.module
  });

  factory StoreModel.fromJson(Map<String, dynamic> json) {
    return StoreModel(
      id: json['id'],
      name: json['name'],
      phone: json['phone'],
      email: json['email'],
      logoUrl: json['logo_full_url'] ?? '',
      logo: json['logo'] ?? '',
      coverPhotoUrl: json['cover_photo_full_url'] ?? AppImages.empty,
      address: json['address'],
      delivery: json['delivery'] ?? false,
      takeAway: json['take_away'] ?? false,
      deliveryTime: json['delivery_time'] ?? '',
      open: json['open'] == 1,
      distance: json['distance']?.toDouble(),
      currentOpeningTime: json['current_opening_time'],
      deliveryFeeTax:json['deliveryfee_tax']?.toDouble(),
      module: json['module'] != null ? Module.fromJson(json['module']) : null,
      categoryIds: (json['category_ids'] as List<dynamic>?)
              ?.map((e) => int.tryParse(e.toString()) ?? 0)
              .toList() ??
          [],
    );
  }
}


class Module{
    final int? id;
    final String? moduleName;
    final String? moduleType;

    Module({
      required this.id,
      required this.moduleName,
      required this.moduleType
    });

    factory Module.fromJson(Map<String,dynamic> json ){

      return Module(
        id: json['id'],
        moduleName: json['module_name'],
        moduleType: json['module_type']
        
        );
    }

}

