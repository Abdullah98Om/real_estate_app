import 'package:real_estate_app/models/categoryModel.dart';
import 'package:real_estate_app/models/cityModel.dart';
import 'package:real_estate_app/models/countryModel.dart';
import 'package:real_estate_app/models/realEstatesModel.dart';
import 'package:real_estate_app/models/subCategoryModel.dart';

class SimilarRealestatesModel {
  String? id;
  String? createdAt;
  String? title;
  String? ownerType;
  String? ownerName;
  String? ownerImageUrl;
  String? offerType;
  double? lat;
  double? lng;
  num? price;
  int? area;
  int? views;
  int? imagesCount;
  bool? hasVideo;
  bool? isUrgent;
  int? age;
  int? noOfRooms;
  int? noOfBedRooms;
  int? noOfBathRooms;
  int? noOfLivingRooms;
  int? noOfFloors;
  int? parkingCapacity;
  String? image;
  BuildingComplexGroup? buildingComplexGroup;
  CountryModel? country;
  CityModel? city;
  District? district;
  SubDistrict? subDistrict;
  CategoryModel? category;
  SubCategoryModel? subCategory;

  SimilarRealestatesModel({
    this.id,
    this.createdAt,
    this.title,
    this.ownerType,
    this.ownerName,
    this.ownerImageUrl,
    this.offerType,
    this.lat,
    this.lng,
    this.price,
    this.area,
    this.views,
    this.imagesCount,
    this.hasVideo,
    this.isUrgent,
    this.age,
    this.noOfRooms,
    this.noOfBedRooms,
    this.noOfBathRooms,
    this.noOfLivingRooms,
    this.noOfFloors,
    this.parkingCapacity,
    this.image,
    this.buildingComplexGroup,
    this.country,
    this.city,
    this.district,
    this.subDistrict,
    this.category,
    this.subCategory,
  });

  factory SimilarRealestatesModel.fromJson(Map<String, dynamic> json) {
    return SimilarRealestatesModel(
      id: json['id'],
      createdAt: json['createdAt'],
      title: json['title'],
      ownerType: json['ownerType'],
      ownerName: json['ownerName'],
      ownerImageUrl: json['ownerImageUrl'],
      offerType: json['offerType'],
      lat: json['lat'] ?? 0.0,
      lng: json['lng'] ?? 0.0,
      price: json['price'] ?? 0.0,
      area: json['area'] ?? 0,
      views: json['views'] ?? 0,
      imagesCount: json['imagesCount'] ?? 0,
      hasVideo: json['hasVideo'] ?? false,
      isUrgent: json['isUrgent'],
      age: json['age'] ?? 0,
      noOfRooms: json['noOfRooms'] ?? 0,
      noOfBedRooms: json['noOfBedRooms'] ?? 0,
      noOfBathRooms: json['noOfBathRooms'] ?? 0,
      noOfLivingRooms: json['noOfLivingRooms'] ?? 0,
      noOfFloors: json['noOfFloors'] ?? 0,
      parkingCapacity: json['parkingCapacity'] ?? 0,
      image: json['image'],
      buildingComplexGroup: json['buildingComplexGroup'] != null
          ? BuildingComplexGroup.fromJson(json['buildingComplexGroup'])
          : null,
      country: json['country'] != null
          ? CountryModel.fromJson(json['country'])
          : null,
      city: json['city'] != null ? CityModel.fromJson(json['city']) : null,
      district:
          json['district'] != null ? District.fromJson(json['district']) : null,
      subDistrict: json['subDistrict'] != null
          ? SubDistrict.fromJson(json['subDistrict'])
          : null,
      category: json['category'] != null
          ? CategoryModel.fromJson(json['category'])
          : null,
      subCategory: json['subCategory'] != null
          ? SubCategoryModel.fromJson(json['subCategory'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['createdAt'] = createdAt;
    data['title'] = title;
    data['ownerType'] = ownerType;
    data['ownerName'] = ownerName;
    data['ownerImageUrl'] = ownerImageUrl;
    data['offerType'] = offerType;
    data['lat'] = lat;
    data['lng'] = lng;
    data['price'] = price;
    data['area'] = area;
    data['views'] = views;
    data['imagesCount'] = imagesCount;
    data['hasVideo'] = hasVideo;
    data['isUrgent'] = isUrgent;
    data['age'] = age;
    data['noOfRooms'] = noOfRooms;
    data['noOfBedRooms'] = noOfBedRooms;
    data['noOfBathRooms'] = noOfBathRooms;
    data['noOfLivingRooms'] = noOfLivingRooms;
    data['noOfFloors'] = noOfFloors;
    data['parkingCapacity'] = parkingCapacity;
    data['image'] = image;
    if (buildingComplexGroup != null) {
      data['buildingComplexGroup'] = buildingComplexGroup!.toJson();
    }
    if (country != null) {
      data['country'] = country!.toJson();
    }
    if (city != null) {
      data['city'] = city!.toJson();
    }
    if (district != null) {
      data['district'] = district!.toJson();
    }
    if (subDistrict != null) {
      data['subDistrict'] = subDistrict!.toJson();
    }
    if (category != null) {
      data['category'] = category!.toJson();
    }
    if (subCategory != null) {
      data['subCategory'] = subCategory!.toJson();
    }
    return data;
  }
}

class BuildingComplexGroup {
  String? id;
  String? name;

  BuildingComplexGroup({this.id, this.name});

  factory BuildingComplexGroup.fromJson(Map<String, dynamic> json) {
    return BuildingComplexGroup(
      id: json['id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}
