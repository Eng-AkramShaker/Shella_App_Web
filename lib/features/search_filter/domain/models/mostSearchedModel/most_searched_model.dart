import 'dart:convert';

class MostSearchedModel {
  int? totalSize;
  int? limit;
  int? offset;
  List<Product>? products;

  MostSearchedModel({
    this.totalSize,
    this.limit,
    this.offset,
    this.products,
  });

  factory MostSearchedModel.fromJson(Map<String, dynamic> json) {
    return MostSearchedModel(
      totalSize: json['total_size'],
      limit: json['limit'],
      offset: json['offset'],
      products: json['products'] != null
          ? List<Product>.from(json['products'].map((x) => Product.fromJson(x)))
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total_size'] = totalSize;
    data['limit'] = limit;
    data['offset'] = offset;
    if (products != null) {
      data['products'] = products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Product {
  int? id;
  String? name;
  String? description;
  String? image;
  int? categoryId;
  int? brandId;
  List<CategoryIds>? categoryIds;
  List<dynamic>?
      variations; // Assuming variations can be empty or have dynamic content
  List<dynamic>? addOns;
  List<dynamic>? attributes;
  List<dynamic>? choiceOptions;
  int? pMargin;
  int? cost;
  int? price;
  bool? catExclude;
  bool? storeExclude;
  int? tax;
  dynamic taxClassId; // Can be null
  dynamic profitClassId; // Can be null
  String? taxCal;
  String? taxType;
  int? discount;
  String? discountType;
  String? availableTimeStarts;
  String? availableTimeEnds;
  int? veg;
  int? status;
  int? storeId;
  String? createdAt;
  String? updatedAt;
  int? orderCount;
  int? avgRating;
  int? ratingCount;
  int? moduleId;
  String? itemSiteId;
  int? stock;
  int? unitId;
  List<ProductImage>? images;
  List<dynamic>? foodVariations;
  String? slug;
  int? recommended;
  int? organic;
  int? maximumCartQuantity;
  int? isApproved;
  int? isHalal;
  String? itemCode;
  String? storeSiteId;
  int? tempAvailable;
  String? moduleType;
  String? storeName;
  int? isCampaign;
  int? zoneId;
  int? flashSale;
  int? storeDiscount;
  bool? scheduleOrder;
  String? deliveryTime;
  bool? freeDelivery;
  Unit? unit;
  int? minDeliveryTime;
  int? maxDeliveryTime;
  int? commonConditionId;
  int? isBasic;
  int? isPrescriptionRequired;
  int? halalTagStatus;
  List<dynamic>? nutritionsName;
  List<dynamic>? allergiesName;
  List<dynamic>? genericName;
  String? unitType;
  String? imageFullUrl;
  List<String>? imagesFullUrl;
  Module? module;
  List<Storage>? storage;
  List<dynamic>? translations;
  dynamic ecommerceItemDetails; // Can be null

  Product({
    this.id,
    this.name,
    this.description,
    this.image,
    this.categoryId,
    this.brandId,
    this.categoryIds,
    this.variations,
    this.addOns,
    this.attributes,
    this.choiceOptions,
    this.pMargin,
    this.cost,
    this.price,
    this.catExclude,
    this.storeExclude,
    this.tax,
    this.taxClassId,
    this.profitClassId,
    this.taxCal,
    this.taxType,
    this.discount,
    this.discountType,
    this.availableTimeStarts,
    this.availableTimeEnds,
    this.veg,
    this.status,
    this.storeId,
    this.createdAt,
    this.updatedAt,
    this.orderCount,
    this.avgRating,
    this.ratingCount,
    this.moduleId,
    this.itemSiteId,
    this.stock,
    this.unitId,
    this.images,
    this.foodVariations,
    this.slug,
    this.recommended,
    this.organic,
    this.maximumCartQuantity,
    this.isApproved,
    this.isHalal,
    this.itemCode,
    this.storeSiteId,
    this.tempAvailable,
    this.moduleType,
    this.storeName,
    this.isCampaign,
    this.zoneId,
    this.flashSale,
    this.storeDiscount,
    this.scheduleOrder,
    this.deliveryTime,
    this.freeDelivery,
    this.unit,
    this.minDeliveryTime,
    this.maxDeliveryTime,
    this.commonConditionId,
    this.isBasic,
    this.isPrescriptionRequired,
    this.halalTagStatus,
    this.nutritionsName,
    this.allergiesName,
    this.genericName,
    this.unitType,
    this.imageFullUrl,
    this.imagesFullUrl,
    this.module,
    this.storage,
    this.translations,
    this.ecommerceItemDetails,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      image: json['image'],
      categoryId: json['category_id'],
      brandId: json['brand_id'],
      categoryIds: json['category_ids'] != null
          ? List<CategoryIds>.from(
              json['category_ids'].map((x) => CategoryIds.fromJson(x)))
          : null,
      variations: json['variations'],
      addOns: json['add_ons'],
      attributes: json['attributes'],
      choiceOptions: json['choice_options'],
      pMargin: json['p_margin'],
      cost: json['cost'],
      price: json['price'],
      catExclude: json['cat_exclude'],
      storeExclude: json['store_exclude'],
      tax: json['tax'],
      taxClassId: json['tax_class_id'],
      profitClassId: json['profit_class_id'],
      taxCal: json['tax_cal'],
      taxType: json['tax_type'],
      discount: json['discount'],
      discountType: json['discount_type'],
      availableTimeStarts: json['available_time_starts'],
      availableTimeEnds: json['available_time_ends'],
      veg: json['veg'],
      status: json['status'],
      storeId: json['store_id'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      orderCount: json['order_count'],
      avgRating: json['avg_rating'],
      ratingCount: json['rating_count'],
      moduleId: json['module_id'],
      itemSiteId: json['item_site_id'],
      stock: json['stock'],
      unitId: json['unit_id'],
      images: json['images'] != null
          ? List<ProductImage>.from(
              json['images'].map((x) => ProductImage.fromJson(x)))
          : null,
      foodVariations: json['food_variations'],
      slug: json['slug'],
      recommended: json['recommended'],
      organic: json['organic'],
      maximumCartQuantity: json['maximum_cart_quantity'],
      isApproved: json['is_approved'],
      isHalal: json['is_halal'],
      itemCode: json['item_code'],
      storeSiteId: json['store_site_id'],
      tempAvailable: json['temp_available'],
      moduleType: json['module_type'],
      storeName: json['store_name'],
      isCampaign: json['is_campaign'],
      zoneId: json['zone_id'],
      flashSale: json['flash_sale'],
      storeDiscount: json['store_discount'],
      scheduleOrder: json['schedule_order'],
      deliveryTime: json['delivery_time'],
      freeDelivery: json['free_delivery'],
      unit: json['unit'] != null ? Unit.fromJson(json['unit']) : null,
      minDeliveryTime: json['min_delivery_time'],
      maxDeliveryTime: json['max_delivery_time'],
      commonConditionId: json['common_condition_id'],
      isBasic: json['is_basic'],
      isPrescriptionRequired: json['is_prescription_required'],
      halalTagStatus: json['halal_tag_status'],
      nutritionsName: json['nutritions_name'],
      allergiesName: json['allergies_name'],
      genericName: json['generic_name'],
      unitType: json['unit_type'],
      imageFullUrl: json['image_full_url'],
      imagesFullUrl: json['images_full_url'] != null
          ? List<String>.from(json['images_full_url'].map((x) => x))
          : null,
      module: json['module'] != null ? Module.fromJson(json['module']) : null,
      storage: json['storage'] != null
          ? List<Storage>.from(json['storage'].map((x) => Storage.fromJson(x)))
          : null,
      translations: json['translations'],
      ecommerceItemDetails: json['ecommerce_item_details'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['image'] = image;
    data['category_id'] = categoryId;
    data['brand_id'] = brandId;
    if (categoryIds != null) {
      data['category_ids'] = categoryIds!.map((v) => v.toJson()).toList();
    }
    data['variations'] = variations;
    data['add_ons'] = addOns;
    data['attributes'] = attributes;
    data['choice_options'] = choiceOptions;
    data['p_margin'] = pMargin;
    data['cost'] = cost;
    data['price'] = price;
    data['cat_exclude'] = catExclude;
    data['store_exclude'] = storeExclude;
    data['tax'] = tax;
    data['tax_class_id'] = taxClassId;
    data['profit_class_id'] = profitClassId;
    data['tax_cal'] = taxCal;
    data['tax_type'] = taxType;
    data['discount'] = discount;
    data['discount_type'] = discountType;
    data['available_time_starts'] = availableTimeStarts;
    data['available_time_ends'] = availableTimeEnds;
    data['veg'] = veg;
    data['status'] = status;
    data['store_id'] = storeId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['order_count'] = orderCount;
    data['avg_rating'] = avgRating;
    data['rating_count'] = ratingCount;
    data['module_id'] = moduleId;
    data['item_site_id'] = itemSiteId;
    data['stock'] = stock;
    data['unit_id'] = unitId;
    if (images != null) {
      data['images'] = images!.map((v) => v.toJson()).toList();
    }
    data['food_variations'] = foodVariations;
    data['slug'] = slug;
    data['recommended'] = recommended;
    data['organic'] = organic;
    data['maximum_cart_quantity'] = maximumCartQuantity;
    data['is_approved'] = isApproved;
    data['is_halal'] = isHalal;
    data['item_code'] = itemCode;
    data['store_site_id'] = storeSiteId;
    data['temp_available'] = tempAvailable;
    data['module_type'] = moduleType;
    data['store_name'] = storeName;
    data['is_campaign'] = isCampaign;
    data['zone_id'] = zoneId;
    data['flash_sale'] = flashSale;
    data['store_discount'] = storeDiscount;
    data['schedule_order'] = scheduleOrder;
    data['delivery_time'] = deliveryTime;
    data['free_delivery'] = freeDelivery;
    if (unit != null) {
      data['unit'] = unit!.toJson();
    }
    data['min_delivery_time'] = minDeliveryTime;
    data['max_delivery_time'] = maxDeliveryTime;
    data['common_condition_id'] = commonConditionId;
    data['is_basic'] = isBasic;
    data['is_prescription_required'] = isPrescriptionRequired;
    data['halal_tag_status'] = halalTagStatus;
    data['nutritions_name'] = nutritionsName;
    data['allergies_name'] = allergiesName;
    data['generic_name'] = genericName;
    data['unit_type'] = unitType;
    data['image_full_url'] = imageFullUrl;
    data['images_full_url'] = imagesFullUrl;
    if (module != null) {
      data['module'] = module!.toJson();
    }
    if (storage != null) {
      data['storage'] = storage!.map((v) => v.toJson()).toList();
    }
    data['translations'] = translations;
    data['ecommerce_item_details'] = ecommerceItemDetails;
    return data;
  }
}

class CategoryIds {
  String? id;
  int? position;
  String? name;

  CategoryIds({
    this.id,
    this.position,
    this.name,
  });

  factory CategoryIds.fromJson(Map<String, dynamic> json) {
    return CategoryIds(
      id: json['id'],
      position: json['position'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['position'] = position;
    data['name'] = name;
    return data;
  }
}

class ProductImage {
  String? img;
  String? storage;

  ProductImage({
    this.img,
    this.storage,
  });

  factory ProductImage.fromJson(Map<String, dynamic> json) {
    return ProductImage(
      img: json['img'],
      storage: json['storage'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['img'] = img;
    data['storage'] = storage;
    return data;
  }
}

class Unit {
  int? id;
  String? unit;
  String? createdAt;
  String? updatedAt;
  List<dynamic>? translations;

  Unit({
    this.id,
    this.unit,
    this.createdAt,
    this.updatedAt,
    this.translations,
  });

  factory Unit.fromJson(Map<String, dynamic> json) {
    return Unit(
      id: json['id'],
      unit: json['unit'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      translations: json['translations'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['unit'] = unit;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['translations'] = translations;
    return data;
  }
}

class Module {
  int? id;
  String? moduleName;
  String? moduleType;
  String? thumbnail;
  String? status;
  int? storesCount;
  String? createdAt;
  String? updatedAt;
  String? icon;
  int? themeId;
  String? description;
  int? allZoneService;
  String? iconFullUrl;
  String? thumbnailFullUrl;
  List<ModuleStorage>? storage;
  List<dynamic>? translations;

  Module({
    this.id,
    this.moduleName,
    this.moduleType,
    this.thumbnail,
    this.status,
    this.storesCount,
    this.createdAt,
    this.updatedAt,
    this.icon,
    this.themeId,
    this.description,
    this.allZoneService,
    this.iconFullUrl,
    this.thumbnailFullUrl,
    this.storage,
    this.translations,
  });

  factory Module.fromJson(Map<String, dynamic> json) {
    return Module(
      id: json['id'],
      moduleName: json['module_name'],
      moduleType: json['module_type'],
      thumbnail: json['thumbnail'],
      status: json['status'],
      storesCount: json['stores_count'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      icon: json['icon'],
      themeId: json['theme_id'],
      description: json['description'],
      allZoneService: json['all_zone_service'],
      iconFullUrl: json['icon_full_url'],
      thumbnailFullUrl: json['thumbnail_full_url'],
      storage: json['storage'] != null
          ? List<ModuleStorage>.from(
              json['storage'].map((x) => ModuleStorage.fromJson(x)))
          : null,
      translations: json['translations'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['module_name'] = moduleName;
    data['module_type'] = moduleType;
    data['thumbnail'] = thumbnail;
    data['status'] = status;
    data['stores_count'] = storesCount;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['icon'] = icon;
    data['theme_id'] = themeId;
    data['description'] = description;
    data['all_zone_service'] = allZoneService;
    data['icon_full_url'] = iconFullUrl;
    data['thumbnail_full_url'] = thumbnailFullUrl;
    if (storage != null) {
      data['storage'] = storage!.map((v) => v.toJson()).toList();
    }
    data['translations'] = translations;
    return data;
  }
}

class ModuleStorage {
  int? id;
  String? dataType;
  String? dataId;
  String? key;
  String? value;
  String? createdAt;
  String? updatedAt;

  ModuleStorage({
    this.id,
    this.dataType,
    this.dataId,
    this.key,
    this.value,
    this.createdAt,
    this.updatedAt,
  });

  factory ModuleStorage.fromJson(Map<String, dynamic> json) {
    return ModuleStorage(
      id: json['id'],
      dataType: json['data_type'],
      dataId: json['data_id'],
      key: json['key'],
      value: json['value'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
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

class Storage {
  int? id;
  String? dataType;
  String? dataId;
  String? key;
  String? value;
  String? createdAt;
  String? updatedAt;

  Storage({
    this.id,
    this.dataType,
    this.dataId,
    this.key,
    this.value,
    this.createdAt,
    this.updatedAt,
  });

  factory Storage.fromJson(Map<String, dynamic> json) {
    return Storage(
      id: json['id'],
      dataType: json['data_type'],
      dataId: json['data_id'],
      key: json['key'],
      value: json['value'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
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
