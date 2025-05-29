class AllCategoriesModel {
  int? id;
  String? storeId;
  String? name;
  String? image;
  int? parentId;
  int? position;
  int? status;
  String? createdAt;
  String? updatedAt;
  int? priority;
  int? moduleId;
  String? catSiteId;
  String? slug;
  int? featured;
  int? productsCount;
  int? childesCount;
  String? imageFullUrl;
  List<Childes>? childes;
  List<Storage>? storage;

  AllCategoriesModel(
      {this.id,
        this.storeId,
        this.name,
        this.image,
        this.parentId,
        this.position,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.priority,
        this.moduleId,
        this.catSiteId,
        this.slug,
        this.featured,
        this.productsCount,
        this.childesCount,
        this.imageFullUrl,
        this.childes,
        this.storage,
        });

  AllCategoriesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    storeId = json['store_id'];
    name = json['name'];
    image = json['image'];
    parentId = json['parent_id'];
    position = json['position'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    priority = json['priority'];
    moduleId = json['module_id'];
    catSiteId = json['cat_site_id'];
    slug = json['slug'];
    featured = json['featured'];
    productsCount = json['products_count'];
    childesCount = json['childes_count'];
    imageFullUrl = json['image_full_url'];
    if (json['childes'] != null) {
      childes = <Childes>[];
      json['childes'].forEach((v) {
        childes!.add(new Childes.fromJson(v));
      });
    }
    if (json['storage'] != null) {
      storage = <Storage>[];
      json['storage'].forEach((v) {
        storage!.add(new Storage.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['store_id'] = storeId;
    data['name'] = name;
    data['image'] = image;
    data['parent_id'] = parentId;
    data['position'] = position;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['priority'] = priority;
    data['module_id'] = moduleId;
    data['cat_site_id'] = catSiteId;
    data['slug'] = slug;
    data['featured'] = featured;
    data['products_count'] = productsCount;
    data['childes_count'] = childesCount;
    data['image_full_url'] = imageFullUrl;
    if (childes != null) {
      data['childes'] = childes!.map((v) => v.toJson()).toList();
    }
    if (storage != null) {
      data['storage'] = storage!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Childes {
  int? id;
  String? storeId;
  String? name;
  String? image;
  int? parentId;
  int? position;
  int? status;
  String? createdAt;
  String? updatedAt;
  int? priority;
  int? moduleId;
  String? catSiteId;
  String? slug;
  int? featured;
  int? productsCount;
  int? childesCount;
  String? imageFullUrl;
  List<Storage>? storage;

  Childes(
      {this.id,
        this.storeId,
        this.name,
        this.image,
        this.parentId,
        this.position,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.priority,
        this.moduleId,
        this.catSiteId,
        this.slug,
        this.featured,
        this.productsCount,
        this.childesCount,
        this.imageFullUrl,
        this.storage,
        });

  Childes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    storeId = json['store_id'];
    name = json['name'];
    image = json['image'];
    parentId = json['parent_id'];
    position = json['position'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    priority = json['priority'];
    moduleId = json['module_id'];
    catSiteId = json['cat_site_id'];
    slug = json['slug'];
    featured = json['featured'];
    productsCount = json['products_count'];
    childesCount = json['childes_count'];
    imageFullUrl = json['image_full_url'];
    if (json['storage'] != null) {
      storage = <Storage>[];
      json['storage'].forEach((v) {
        storage!.add(new Storage.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['store_id'] = storeId;
    data['name'] = name;
    data['image'] = image;
    data['parent_id'] = parentId;
    data['position'] = position;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['priority'] = priority;
    data['module_id'] = moduleId;
    data['cat_site_id'] = catSiteId;
    data['slug'] = slug;
    data['featured'] = featured;
    data['products_count'] = productsCount;
    data['childes_count'] = childesCount;
    data['image_full_url'] = imageFullUrl;
    if (storage != null) {
      data['storage'] = storage!.map((v) => v.toJson()).toList();
    }
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

  Storage(
      {this.id,
        this.dataType,
        this.dataId,
        this.key,
        this.value,
        this.createdAt,
        this.updatedAt});

  Storage.fromJson(Map<String, dynamic> json) {
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