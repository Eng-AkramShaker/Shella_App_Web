// To parse this JSON data, do
//
//     final itemSearchResponse = itemSearchResponseFromJson(jsonString);

import 'dart:convert';

ItemSearchResponse itemSearchResponseFromJson(String str) => ItemSearchResponse.fromJson(json.decode(str));

String itemSearchResponseToJson(ItemSearchResponse data) => json.encode(data.toJson());

class ItemSearchResponse {
    List<ItemModel> items;

    ItemSearchResponse({
        required this.items,
    });

    factory ItemSearchResponse.fromJson(Map<String, dynamic> json) => ItemSearchResponse(
        items: List<ItemModel>.from(json["items"].map((x) => ItemModel.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
    };
}

class ItemModel {
    int id;
    String? name;
    String? image;
    String? unitType;
    String? imageUrlFull;
    List<String>? imagesFullUrl; // Can be null, or an empty list
    List<Storage>? storage;
    List<Translation>? translations;
    dynamic unit; // Can be null or another object type

    ItemModel({
        required this.id,
        this.name,
        this.image,
        this.unitType,
        this.imageUrlFull,
        this.imagesFullUrl,
        this.storage,
        this.translations,
        this.unit,
    });

    factory ItemModel.fromJson(Map<String, dynamic> json) => ItemModel(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        unitType: json["unit_type"],
        imageUrlFull: json["image_full_url"],
        // Handle images_full_url being null or an empty array
        imagesFullUrl: json["images_full_url"] == null
            ? null
            : List<String>.from(json["images_full_url"].map((x) => x)),
        // Handle storage and translations being null or empty
        storage: json["storage"] == null
            ? null
            : List<Storage>.from(json["storage"]!.map((x) => Storage.fromJson(x))),
        translations: json["translations"] == null
            ? null
            : List<Translation>.from(json["translations"]!.map((x) => Translation.fromJson(x))),
        unit: json["unit"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "unit_type": unitType,
        "image_full_url": imageUrlFull,
        "images_full_url": imagesFullUrl == null ? null : List<dynamic>.from(imagesFullUrl!.map((x) => x)),
        "storage": storage == null ? null : List<dynamic>.from(storage!.map((x) => x.toJson())),
        "translations": translations == null ? null : List<dynamic>.from(translations!.map((x) => x.toJson())),
        "unit": unit,
    };
}

class Storage {
    int id;
    String dataType;
    String dataId;
    String key;
    String value;
    DateTime createdAt;
    DateTime? updatedAt; // Can be null

    Storage({
        required this.id,
        required this.dataType,
        required this.dataId,
        required this.key,
        required this.value,
        required this.createdAt,
        this.updatedAt,
    });

    factory Storage.fromJson(Map<String, dynamic> json) => Storage(
        id: json["id"],
        dataType: json["data_type"],
        dataId: json["data_id"],
        key: json["key"],
        value: json["value"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "data_type": dataType,
        "data_id": dataId,
        "key": key,
        "value": value,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
    };
}

class Translation {
    int id;
    String translationableType;
    int translationableId;
    String locale;
    String key;
    String value;
    DateTime? createdAt; // Can be null
    DateTime? updatedAt; // Can be null

    Translation({
        required this.id,
        required this.translationableType,
        required this.translationableId,
        required this.locale,
        required this.key,
        required this.value,
        this.createdAt,
        this.updatedAt,
    });

    factory Translation.fromJson(Map<String, dynamic> json) => Translation(
        id: json["id"],
        translationableType: json["translationable_type"],
        translationableId: json["translationable_id"],
        locale: json["locale"],
        key: json["key"],
        value: json["value"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "translationable_type": translationableType,
        "translationable_id": translationableId,
        "locale": locale,
        "key": key,
        "value": value,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
    };
}