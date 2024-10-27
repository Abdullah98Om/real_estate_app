import 'package:real_estate_app/models/namesModel.dart';
import 'package:real_estate_app/models/statsModel.dart';
import 'package:real_estate_app/models/subCategoryModel.dart';

class CategoryModel {
  String? id;
  int? sortingIndex;
  bool? isActive;
  bool? isDeleted;
  String? image;
  List<dynamic>? types;
  NamesModel? names;
  String? name;
  List<SubCategoryModel>? subCategories;
  StatsModel? stats;

  CategoryModel({
    this.id,
    this.name,
    this.sortingIndex,
    this.isActive,
    this.isDeleted,
    this.image,
    this.types,
    this.names,
    this.subCategories,
    this.stats,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      sortingIndex: json['sortingIndex'] ?? 0,
      isActive: json['isActive'] ?? false,
      isDeleted: json['isDeleted'] ?? false,
      image: json['image'] ?? '',
      types: json['types'] != null ? List<dynamic>.from(json['types']) : null,
      names: json['names'] != null ? NamesModel.fromJson(json['names']) : null,
      subCategories: json['subCategories'] != null
          ? (json['subCategories'] as List)
              .map((subCategoryJson) =>
                  SubCategoryModel.fromJson(subCategoryJson))
              .toList()
          : null,
      stats: json['stats'] != null ? StatsModel.fromJson(json['stats']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'sortingIndex': sortingIndex,
      'isActive': isActive,
      'isDeleted': isDeleted,
      'image': image,
      'types': types,
      'names': names,
      'subCategories':
          subCategories?.map((subCategory) => subCategory.toJson()).toList(),
      'stats': stats?.toJson(),
    };
  }
}

class RealestateStats {
  int total;
  int urgent;
  String offerType;
  OwnerType ownerType;

  RealestateStats({
    required this.total,
    required this.urgent,
    required this.offerType,
    required this.ownerType,
  });

  factory RealestateStats.fromJson(Map<String, dynamic> json) {
    return RealestateStats(
      total: json['total'] ?? 0,
      urgent: json['urgent'] ?? 0,
      offerType: json['offerType'] ?? '',
      ownerType: OwnerType.fromJson(json['ownerType']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'total': total,
      'urgent': urgent,
      'offerType': offerType,
      'ownerType': ownerType.toJson(),
    };
  }
}

class OwnerType {
  int realestateAgency;
  int constructionCompany;
  int customer;

  OwnerType({
    required this.realestateAgency,
    required this.constructionCompany,
    required this.customer,
  });

  factory OwnerType.fromJson(Map<String, dynamic> json) {
    return OwnerType(
      realestateAgency: json['realestateAgency'] ?? 0,
      constructionCompany: json['constructionCompany'] ?? 0,
      customer: json['customer'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'realestateAgency': realestateAgency,
      'constructionCompany': constructionCompany,
      'customer': customer,
    };
  }
}
