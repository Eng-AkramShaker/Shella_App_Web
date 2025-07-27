// lib/features/home/domain/models/advertisement_model.dart

class AdvertisementModel {
  int? id;
  int? storeId;
  int? moduleId; // أضفت هذا الحقل بناءً على JSON الخاص بك
  String? moduleType; // أضفت هذا الحقل بناءً على JSON الخاص بك
  String? addType;
  String? title;
  String? description; // تم تغيير النوع من 'var' إلى 'String?'
  String? startDate;
  String? endDate;
  String? pauseNote;
  String? cancellationNote;
  String? coverImage;
  String? profileImage;
  String? videoAttachment;
  int? priority; // أضفت هذا الحقل بناءً على JSON الخاص بك
  int? isRatingActive;
  int? isReviewActive;
  int? isPaid;
  int? isUpdated;
  int? createdById;
  String? createdByType;
  String? status;
  String? createdAt;
  String? updatedAt;
  int? active; // أضفت هذا الحقل بناءً على JSON الخاص بك
  String? coverImageFullUrl;
  String? profileImageFullUrl;
  String? videoAttachmentFullUrl;
  double? averageRating;
  int? reviewsCommentsCount;
  Store? store; // أضفت هذا الحقل لتمثيل كائن الـ Store
  List<dynamic>?
      translations; // List of dynamic for translations, adjust if you have a specific TranslationModel
  List<StorageItem>? storage; // أضفت هذا الحقل لتمثيل الـ Storage items

  AdvertisementModel({
    this.id,
    this.storeId,
    this.moduleId,
    this.moduleType,
    this.addType,
    this.title,
    this.description,
    this.startDate,
    this.endDate,
    this.pauseNote,
    this.cancellationNote,
    this.coverImage,
    this.profileImage,
    this.videoAttachment,
    this.priority,
    this.isRatingActive,
    this.isReviewActive,
    this.isPaid,
    this.isUpdated,
    this.createdById,
    this.createdByType,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.active,
    this.coverImageFullUrl,
    this.profileImageFullUrl,
    this.videoAttachmentFullUrl,
    this.averageRating,
    this.reviewsCommentsCount,
    this.store,
    this.translations,
    this.storage,
  });

  AdvertisementModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    storeId = json['store_id'];
    moduleId = json['module_id'];
    moduleType = json['module_type'];
    addType = json['add_type'];
    title = json['title'];
    description = json['description'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    pauseNote = json['pause_note'];
    cancellationNote = json['cancellation_note'];
    coverImage = json['cover_image'];
    profileImage = json['profile_image'];
    videoAttachment = json['video_attachment'];
    priority = json['priority'];
    isRatingActive = json['is_rating_active'];
    isReviewActive = json['is_review_active'];
    isPaid = json['is_paid'];
    isUpdated = json['is_updated'];
    createdById = json['created_by_id'];
    createdByType = json['created_by_type'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    active = json['active'];
    coverImageFullUrl = json['cover_image_full_url'];
    profileImageFullUrl = json['profile_image_full_url'];
    videoAttachmentFullUrl = json['video_attachment_full_url'];
    averageRating = json['average_rating']?.toDouble();
    reviewsCommentsCount = json['reviews_comments_count'];
    store = json['store'] != null ? Store.fromJson(json['store']) : null;
    if (json['translations'] != null) {
      translations = <dynamic>[];
      json['translations'].forEach((v) {
        translations!.add(
            v); // يمكنك تحويلها إلى قائمة من TranslationModel إذا كان لديك هذا الكلاس
      });
    }
    if (json['storage'] != null) {
      storage = <StorageItem>[];
      json['storage'].forEach((v) {
        storage!.add(StorageItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['store_id'] = storeId;
    data['module_id'] = moduleId;
    data['module_type'] = moduleType;
    data['add_type'] = addType;
    data['title'] = title;
    data['description'] = description;
    data['start_date'] = startDate;
    data['end_date'] = endDate;
    data['pause_note'] = pauseNote;
    data['cancellation_note'] = cancellationNote;
    data['cover_image'] = coverImage;
    data['profile_image'] = profileImage;
    data['video_attachment'] = videoAttachment;
    data['priority'] = priority;
    data['is_rating_active'] = isRatingActive;
    data['is_review_active'] = isReviewActive;
    data['is_paid'] = isPaid;
    data['is_updated'] = isUpdated;
    data['created_by_id'] = createdById;
    data['created_by_type'] = createdByType;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['active'] = active;
    data['cover_image_full_url'] = coverImageFullUrl;
    data['profile_image_full_url'] = profileImageFullUrl;
    data['video_attachment_full_url'] = videoAttachmentFullUrl;
    data['average_rating'] = averageRating;
    data['reviews_comments_count'] = reviewsCommentsCount;
    if (store != null) {
      data['store'] = store!.toJson();
    }
    if (translations != null) {
      data['translations'] = translations!
          .map((v) => v)
          .toList(); // يمكنك تعديل هذا إذا كانت الترجمات كلاس معين
    }
    if (storage != null) {
      data['storage'] = storage!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

// Model for the 'Store' object nested within AdvertisementModel
class Store {
  int? id;
  String? name;
  String? phone;
  String? email;
  String? logo;
  String? latitude;
  String? longitude;
  String? address;
  String? footerText;
  double? minimumOrder;
  dynamic comission;
  bool? scheduleOrder;
  int? status;
  int? vendorId;
  int? adminAprove;
  String? createdAt;
  String? updatedAt;
  bool? freeDelivery;
  List<int>? rating; // Assuming this is a list of integers based on your JSON
  String? coverPhoto;
  bool? delivery;
  bool? takeAway;
  bool? itemSection;
  double? tax;
  double? deliveryfeeTax;
  String? taxCal;
  int? zoneId;
  bool? reviewsSection;
  bool? active;
  int? selfDeliverySystem;
  bool? posSystem;
  double? minimumShippingCharge;
  String? deliveryTime;
  int? veg;
  int? nonVeg;
  int? orderCount;
  int? totalOrder;
  int? moduleId;
  int? orderPlaceToScheduleInterval;
  int? featured;
  double? perKmShippingCharge;
  bool? prescriptionOrder;
  String? slug;
  dynamic maximumShippingCharge;
  bool? cutlery;
  dynamic metaTitle;
  dynamic metaDescription;
  dynamic metaImage;
  int? announcement;
  dynamic announcementMessage;
  String? storeBusinessModel;
  dynamic packageId;
  dynamic pickupZoneId;
  dynamic comment;
  int? pMargin;
  String? offDay;
  bool? gstStatus;
  String? gstCode;
  String? logoFullUrl;
  String? coverPhotoFullUrl;
  String? metaImageFullUrl;
  List<Translation>? translations; // Assuming a Translation model
  List<StorageItem>? storage; // Assuming a StorageItem model

  Store({
    this.id,
    this.name,
    this.phone,
    this.email,
    this.logo,
    this.latitude,
    this.longitude,
    this.address,
    this.footerText,
    this.minimumOrder,
    this.comission,
    this.scheduleOrder,
    this.status,
    this.vendorId,
    this.adminAprove,
    this.createdAt,
    this.updatedAt,
    this.freeDelivery,
    this.rating,
    this.coverPhoto,
    this.delivery,
    this.takeAway,
    this.itemSection,
    this.tax,
    this.deliveryfeeTax,
    this.taxCal,
    this.zoneId,
    this.reviewsSection,
    this.active,
    this.selfDeliverySystem,
    this.posSystem,
    this.minimumShippingCharge,
    this.deliveryTime,
    this.veg,
    this.nonVeg,
    this.orderCount,
    this.totalOrder,
    this.moduleId,
    this.orderPlaceToScheduleInterval,
    this.featured,
    this.perKmShippingCharge,
    this.prescriptionOrder,
    this.slug,
    this.maximumShippingCharge,
    this.cutlery,
    this.metaTitle,
    this.metaDescription,
    this.metaImage,
    this.announcement,
    this.announcementMessage,
    this.storeBusinessModel,
    this.packageId,
    this.pickupZoneId,
    this.comment,
    this.pMargin,
    this.offDay,
    this.gstStatus,
    this.gstCode,
    this.logoFullUrl,
    this.coverPhotoFullUrl,
    this.metaImageFullUrl,
    this.translations,
    this.storage,
  });

  Store.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
    logo = json['logo'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    address = json['address'];
    footerText = json['footer_text'];
    minimumOrder = json['minimum_order']?.toDouble();
    comission = json['comission'];
    scheduleOrder = json['schedule_order'];
    status = json['status'];
    vendorId = json['vendor_id'];
    adminAprove = json['admin_aprove'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    freeDelivery = json['free_delivery'];
    if (json['rating'] != null) {
      rating = List<int>.from(json['rating']);
    }
    coverPhoto = json['cover_photo'];
    delivery = json['delivery'];
    takeAway = json['take_away'];
    itemSection = json['item_section'];
    tax = json['tax']?.toDouble();
    deliveryfeeTax = json['deliveryfee_tax']?.toDouble();
    taxCal = json['tax_cal'];
    zoneId = json['zone_id'];
    reviewsSection = json['reviews_section'];
    active = json['active'];
    selfDeliverySystem = json['self_delivery_system'];
    posSystem = json['pos_system'];
    minimumShippingCharge = json['minimum_shipping_charge']?.toDouble();
    deliveryTime = json['delivery_time'];
    veg = json['veg'];
    nonVeg = json['non_veg'];
    orderCount = json['order_count'];
    totalOrder = json['total_order'];
    moduleId = json['module_id'];
    orderPlaceToScheduleInterval = json['order_place_to_schedule_interval'];
    featured = json['featured'];
    perKmShippingCharge = json['per_km_shipping_charge']?.toDouble();
    prescriptionOrder = json['prescription_order'];
    slug = json['slug'];
    maximumShippingCharge = json['maximum_shipping_charge'];
    cutlery = json['cutlery'];
    metaTitle = json['meta_title'];
    metaDescription = json['meta_description'];
    metaImage = json['meta_image'];
    announcement = json['announcement'];
    announcementMessage = json['announcement_message'];
    storeBusinessModel = json['store_business_model'];
    packageId = json['package_id'];
    pickupZoneId = json['pickup_zone_id'];
    comment = json['comment'];
    pMargin = json['p_margin'];
    offDay = json['off_day'];
    gstStatus = json['gst_status'];
    gstCode = json['gst_code'];
    logoFullUrl = json['logo_full_url'];
    coverPhotoFullUrl = json['cover_photo_full_url'];
    metaImageFullUrl = json['meta_image_full_url'];
    if (json['translations'] != null) {
      translations = <Translation>[];
      json['translations'].forEach((v) {
        translations!.add(Translation.fromJson(v));
      });
    }
    if (json['storage'] != null) {
      storage = <StorageItem>[];
      json['storage'].forEach((v) {
        storage!.add(StorageItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['phone'] = phone;
    data['email'] = email;
    data['logo'] = logo;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['address'] = address;
    data['footer_text'] = footerText;
    data['minimum_order'] = minimumOrder;
    data['comission'] = comission;
    data['schedule_order'] = scheduleOrder;
    data['status'] = status;
    data['vendor_id'] = vendorId;
    data['admin_aprove'] = adminAprove;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['free_delivery'] = freeDelivery;
    data['rating'] = rating;
    data['cover_photo'] = coverPhoto;
    data['delivery'] = delivery;
    data['take_away'] = takeAway;
    data['item_section'] = itemSection;
    data['tax'] = tax;
    data['deliveryfee_tax'] = deliveryfeeTax;
    data['tax_cal'] = taxCal;
    data['zone_id'] = zoneId;
    data['reviews_section'] = reviewsSection;
    data['active'] = active;
    data['self_delivery_system'] = selfDeliverySystem;
    data['pos_system'] = posSystem;
    data['minimum_shipping_charge'] = minimumShippingCharge;
    data['delivery_time'] = deliveryTime;
    data['veg'] = veg;
    data['non_veg'] = nonVeg;
    data['order_count'] = orderCount;
    data['total_order'] = totalOrder;
    data['module_id'] = moduleId;
    data['order_place_to_schedule_interval'] = orderPlaceToScheduleInterval;
    data['featured'] = featured;
    data['per_km_shipping_charge'] = perKmShippingCharge;
    data['prescription_order'] = prescriptionOrder;
    data['slug'] = slug;
    data['maximum_shipping_charge'] = maximumShippingCharge;
    data['cutlery'] = cutlery;
    data['meta_title'] = metaTitle;
    data['meta_description'] = metaDescription;
    data['meta_image'] = metaImage;
    data['announcement'] = announcement;
    data['announcement_message'] = announcementMessage;
    data['store_business_model'] = storeBusinessModel;
    data['package_id'] = packageId;
    data['pickup_zone_id'] = pickupZoneId;
    data['comment'] = comment;
    data['p_margin'] = pMargin;
    data['off_day'] = offDay;
    data['gst_status'] = gstStatus;
    data['gst_code'] = gstCode;
    data['logo_full_url'] = logoFullUrl;
    data['cover_photo_full_url'] = coverPhotoFullUrl;
    data['meta_image_full_url'] = metaImageFullUrl;
    if (translations != null) {
      data['translations'] = translations!.map((v) => v.toJson()).toList();
    }
    if (storage != null) {
      data['storage'] = storage!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

// Model for Translation object
class Translation {
  int? id;
  String? translationableType;
  int? translationableId;
  String? locale;
  String? key;
  String? value;
  String? createdAt;
  String? updatedAt;

  Translation({
    this.id,
    this.translationableType,
    this.translationableId,
    this.locale,
    this.key,
    this.value,
    this.createdAt,
    this.updatedAt,
  });

  Translation.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    translationableType = json['translationable_type'];
    translationableId = json['translationable_id'];
    locale = json['locale'];
    key = json['key'];
    value = json['value'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['translationable_type'] = translationableType;
    data['translationable_id'] = translationableId;
    data['locale'] = locale;
    data['key'] = key;
    data['value'] = value;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

// Model for StorageItem object
class StorageItem {
  int? id;
  String? dataType;
  String? dataId;
  String? key;
  String? value;
  String? createdAt;
  String? updatedAt;

  StorageItem({
    this.id,
    this.dataType,
    this.dataId,
    this.key,
    this.value,
    this.createdAt,
    this.updatedAt,
  });

  StorageItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dataType = json['data_type'];
    dataId = json['data_id'];
    key = json['key'];
    value = json['value'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['data_type'] = dataType;
    data['data_id'] = dataId;
    data['key'] = key;
    data['value'] = value;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
