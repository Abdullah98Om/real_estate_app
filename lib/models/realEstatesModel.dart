import 'package:real_estate_app/models/categoryModel.dart';
import 'package:real_estate_app/models/cityModel.dart';
import 'package:real_estate_app/models/countryModel.dart';
import 'package:real_estate_app/models/realestateGroupModel.dart';
// import 'package:real_estate_app/models/realestateGroupModel.dart';
import 'package:real_estate_app/models/similarRealEstateModel.dart';
import 'package:real_estate_app/models/subCategoryModel.dart';
import 'package:real_estate_app/models/userModel.dart';

class RealEstateModel {
  num? price;
  String? id;
  String? image;
  DateTime? createdAt;
  DateTime? updatedAt;
  UserModel? user;
  CountryModel? country;
  CityModel? city;
  District? district;
  SubDistrict? subDistrict;
  SubCategoryModel? subCategory;
  CategoryModel? category;
  dynamic ownerType;
  String? subScriptionPlanId;
  String? status;
  String? phoneNumber;
  double? area;
  String? posterUrl;
  RealestateGroupModel? realestateGroup;
  String? relestateSample;
  bool isFavorite;
  String title;
  String? description;
  String? nearestPoint;
  String? commName;
  String fullAddress;
  String? avenueName;
  int streetNo;
  int districtNo;
  double lng;
  double lat;
  int? views;
  bool isSold;
  bool isPublished;
  bool isAddedFromDashboard;
  DateTime expiresAt;
  List<String>? images;
  String? video;
  String? offerType;
  String payType;
  String ownershipType;
  String? installmentDetails;
  List<String>? features;
  int age;
  int? noOfRooms;
  int noOfBedRooms;
  int noOfBathRooms;
  int noOfLivingRooms;
  int noOfFloors;
  int? noOfApartments;
  int parkingCapacity;
  double frontageWidth;
  double frontageDepth;
  double? constructionArea;
  double? gardenArea;
  String? flooringType;
  String? claddingType;
  String? windowType;
  String? nearbyType;
  String? facingDirection;
  String? residencyType;
  bool forGender;
  BuildingComplexGroupModel? buildingComplexGroup;
  String blockNumber;
  String buildingNumber;
  int floorNumber;
  int flatNumber;
  int? noOfUnits;
  int similarRealestatesCount;
  List<SimilarRealestatesModel>? similarRealestates;

  RealEstateModel(
      {this.price,
      required this.id,
      required this.createdAt,
      this.updatedAt,
      required this.user,
      this.country,
      this.city,
      this.district,
      this.subDistrict,
      this.subCategory,
      this.category,
      required this.ownerType,
      this.subScriptionPlanId,
      required this.status,
      required this.phoneNumber,
      required this.area,
      this.posterUrl,
      this.realestateGroup,
      this.relestateSample,
      required this.isFavorite,
      required this.title,
      this.description,
      this.nearestPoint,
      this.commName,
      required this.fullAddress,
      this.avenueName,
      required this.streetNo,
      required this.districtNo,
      required this.lng,
      required this.lat,
      this.views,
      required this.isSold,
      required this.isPublished,
      required this.isAddedFromDashboard,
      required this.expiresAt,
      this.images,
      this.video,
      this.offerType,
      required this.payType,
      required this.ownershipType,
      this.installmentDetails,
      this.features,
      required this.age,
      this.noOfRooms,
      required this.noOfBedRooms,
      required this.noOfBathRooms,
      required this.noOfLivingRooms,
      required this.noOfFloors,
      this.noOfApartments,
      required this.parkingCapacity,
      required this.frontageWidth,
      required this.frontageDepth,
      this.constructionArea,
      this.gardenArea,
      this.flooringType,
      this.claddingType,
      this.windowType,
      this.nearbyType,
      this.facingDirection,
      this.residencyType,
      required this.forGender,
      this.buildingComplexGroup,
      required this.blockNumber,
      required this.buildingNumber,
      required this.floorNumber,
      required this.flatNumber,
      this.noOfUnits,
      required this.similarRealestatesCount,
      this.similarRealestates,
      this.image});

  factory RealEstateModel.fromJson(Map<String, dynamic> json) {
    return RealEstateModel(
      price: (json['price'] is double) ? (json['price'] as double) : 0.0,
      id: json['id'],
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'])
          : DateTime.now(),
      updatedAt:
          json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
      user: json['user'] != null ? UserModel.fromJson(json['user']) : null,
      country: json['country'] != null
          ? CountryModel.fromJson(json['country'])
          : null,
      city: json['city'] != null ? CityModel.fromJson(json['city']) : null,
      district:
          json['district'] != null ? District.fromJson(json['district']) : null,
      subDistrict: json['subDistrict'] != null
          ? SubDistrict.fromJson(json['subDistrict'])
          : null,
      subCategory: json['subCategory'] != null
          ? SubCategoryModel.fromJson(json['subCategory'])
          : null,
      category: json['category'] != null
          ? CategoryModel.fromJson(json['category'])
          : null,
      ownerType: json['ownerType'],
      subScriptionPlanId: json['subScriptionPlanId'],
      status: json['status'],
      phoneNumber: json['phoneNumber'],
      area: (json['area'] is double) ? (json['area'] as double) : 0.0,
      posterUrl: json['posterUrl'],
      realestateGroup: json['realestateGroup'] != null
          ? RealestateGroupModel.fromJson(json['realestateGroup'])
          : null,
      relestateSample: json['relestateSample'],
      isFavorite: json['isFavorite'] ?? false,
      title: json['title'] ?? "",
      description: json['description'],
      nearestPoint: json['nearestPoint'],
      commName: json['commName'],
      fullAddress: json['fullAddress'] ?? "",
      avenueName: json['avenueName'],
      streetNo:
          (json['streetNo'] is num) ? (json['streetNo'] as num).toInt() : 0,
      districtNo:
          (json['districtNo'] is num) ? (json['districtNo'] as num).toInt() : 0,
      lng: (json['lng'] is num) ? (json['lng'] as num).toDouble() : 0.0,
      lat: (json['lat'] is num) ? (json['lat'] as num).toDouble() : 0.0,
      views: (json['views'] is num) ? (json['views'] as num).toInt() : 0,
      isSold: json['isSold'] ?? false,
      isPublished: json['isPublished'] ?? false,
      isAddedFromDashboard: json['isAddedFromDashboard'] ?? false,
      expiresAt: json['expiresAt'] != null
          ? DateTime.parse(json['expiresAt'])
          : DateTime.now(),
      images: json['images'] != null ? List<String>.from(json['images']) : null,
      video: json['video'] ?? "",
      offerType: json['offerType'].toString() ?? "",
      payType: json['payType'] ?? "",
      ownershipType: json['ownershipType'] ?? "",
      installmentDetails: json['installmentDetails'] ?? "",
      features:
          json['features'] != null ? List<String>.from(json['features']) : null,
      age: (json['age'] is num) ? (json['age'] as num).toInt() : 0,
      noOfRooms:
          (json['noOfRooms'] is num) ? (json['noOfRooms'] as num).toInt() : 0,
      noOfBedRooms: (json['noOfBedRooms'] is num)
          ? (json['noOfBedRooms'] as num).toInt()
          : 0,
      noOfBathRooms: (json['noOfBathRooms'] is num)
          ? (json['noOfBathRooms'] as num).toInt()
          : 0,
      noOfLivingRooms: (json['noOfLivingRooms'] is num)
          ? (json['noOfLivingRooms'] as num).toInt()
          : 0,
      noOfFloors:
          (json['noOfFloors'] is num) ? (json['noOfFloors'] as num).toInt() : 0,
      noOfApartments: (json['noOfApartments'] is num)
          ? (json['noOfApartments'] as num).toInt()
          : 0,
      parkingCapacity: (json['parkingCapacity'] is num)
          ? (json['parkingCapacity'] as num).toInt()
          : 0,
      frontageWidth: (json['frontageWidth'] is num)
          ? (json['frontageWidth'] as num).toDouble()
          : 0.0,
      frontageDepth: (json['frontageDepth'] is num)
          ? (json['frontageDepth'] as num).toDouble()
          : 0.0,
      constructionArea: (json['constructionArea'] is num)
          ? (json['constructionArea'] as num).toDouble()
          : 0.0,
      gardenArea: (json['gardenArea'] is num)
          ? (json['gardenArea'] as num).toDouble()
          : 0.0,
      flooringType: json['flooringType'] ?? "",
      claddingType: json['claddingType'] ?? "",
      windowType: json['windowType'] ?? "",
      nearbyType: json['nearbyType'] ?? "",
      facingDirection: json['facingDirection'] ?? "",
      residencyType: json['residencyType'] ?? "",
      forGender: json['forGender'] ?? false,
      buildingComplexGroup: json['buildingComplexGroup'] != null
          ? BuildingComplexGroupModel.fromJson(json['buildingComplexGroup'])
          : null,
      blockNumber: json['blockNumber'] ?? "",
      buildingNumber: json['buildingNumber'] ?? "",
      floorNumber: (json['floorNumber'] is num)
          ? (json['floorNumber'] as num).toInt()
          : 0,
      flatNumber:
          (json['flatNumber'] is num) ? (json['flatNumber'] as num).toInt() : 0,
      noOfUnits:
          (json['noOfUnits'] is num) ? (json['noOfUnits'] as num).toInt() : 0,
      similarRealestatesCount: (json['similarRealestatesCount'] is num)
          ? (json['similarRealestatesCount'] as num).toInt()
          : 0,
      similarRealestates: json['similarRealestates'] != null
          ? List<SimilarRealestatesModel>.from(json['similarRealestates']
              .map((item) => SimilarRealestatesModel.fromJson(item)))
          : null,
      image: json['image'] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'price': price,
      'id': id,
      'createdAt': createdAt!.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
      'user': user?.toJson(),
      'country': country?.toJson(),
      'city': city?.toJson(),
      'district': district?.toJson(),
      'subDistrict': subDistrict?.toJson(),
      'subCategory': subCategory?.toJson(),
      'category': category?.toJson(),
      'ownerType': ownerType,
      'subScriptionPlanId': subScriptionPlanId,
      'status': status,
      'phoneNumber': phoneNumber,
      'area': area,
      'posterUrl': posterUrl,
      'realestateGroup': realestateGroup?.toJson(),
      'relestateSample': relestateSample,
      'isFavorite': isFavorite,
      'title': title,
      'description': description,
      'nearestPoint': nearestPoint,
      'commName': commName,
      'fullAddress': fullAddress,
      'avenueName': avenueName,
      'streetNo': streetNo,
      'districtNo': districtNo,
      'lng': lng,
      'lat': lat,
      'views': views,
      'isSold': isSold,
      'isPublished': isPublished,
      'isAddedFromDashboard': isAddedFromDashboard,
      'expiresAt': expiresAt.toIso8601String(),
      'images': images,
      'video': video,
      'offerType': offerType,
      'payType': payType,
      'ownershipType': ownershipType,
      'installmentDetails': installmentDetails,
      'features': features,
      'age': age,
      'noOfRooms': noOfRooms,
      'noOfBedRooms': noOfBedRooms,
      'noOfBathRooms': noOfBathRooms,
      'noOfLivingRooms': noOfLivingRooms,
      'noOfFloors': noOfFloors,
      'noOfApartments': noOfApartments,
      'parkingCapacity': parkingCapacity,
      'frontageWidth': frontageWidth,
      'frontageDepth': frontageDepth,
      'constructionArea': constructionArea,
      'gardenArea': gardenArea,
      'flooringType': flooringType,
      'claddingType': claddingType,
      'windowType': windowType,
      'nearbyType': nearbyType,
      'facingDirection': facingDirection,
      'residencyType': residencyType,
      'forGender': forGender,
      'buildingComplexGroup': buildingComplexGroup,
      'blockNumber': blockNumber,
      'buildingNumber': buildingNumber,
      'floorNumber': floorNumber,
      'flatNumber': flatNumber,
      'noOfUnits': noOfUnits,
      'similarRealestatesCount': similarRealestatesCount,
      'similarRealestates':
          similarRealestates?.map((item) => item.toJson()).toList(),
      'image': image
    };
  }
}

class BuildingComplexGroupModel {
  String? id;
  String? name;

  BuildingComplexGroupModel({this.id, this.name});

  factory BuildingComplexGroupModel.fromJson(Map<String, dynamic> json) {
    return BuildingComplexGroupModel(
      id: json['id'],
      name: json['name'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}

class District {
  String? id;
  String? name;

  District({this.id, this.name});

  factory District.fromJson(Map<String, dynamic> json) {
    return District(
      id: json['id'],
      name: json['name'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}

class SubDistrict {
  String? id;
  String? name;

  SubDistrict({this.id, this.name});

  factory SubDistrict.fromJson(Map<String, dynamic> json) {
    return SubDistrict(
      id: json['id'],
      name: json['name'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}
