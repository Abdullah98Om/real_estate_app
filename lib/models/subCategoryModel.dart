import 'package:real_estate_app/models/categoryModel.dart';
import 'package:real_estate_app/models/namesModel.dart';

class SubCategoryModel {
  String id;
  int sortingIndex;
  bool isActive;
  bool isDeleted;
  String image;
  String? name;
  NamesModel? names; // استخدام nullable
  CategoryModel? category; // استخدام nullable
  dynamic stats; // يمكن تعديلها بناءً على نوع البيانات المتوقعة
  List<String>? realestateFeatures; // استخدام nullable
  List<String>? features; // استخدام nullable

  SubCategoryModel({
    required this.id,
    this.name,
    required this.sortingIndex,
    required this.isActive,
    required this.isDeleted,
    required this.image,
    this.names, // جعلها اختيارية
    this.category, // جعلها اختيارية
    this.stats,
    this.realestateFeatures, // جعلها اختيارية
    this.features, // جعلها اختيارية
  });

  factory SubCategoryModel.fromJson(Map<String, dynamic> json) {
    return SubCategoryModel(
        id: json['id'] ?? '',
        sortingIndex: json['sortingIndex'] ?? 0,
        isActive: json['isActive'] ?? false,
        isDeleted: json['isDeleted'] ?? false,
        image: json['image'] ?? '',
        names:
            json['names'] != null ? NamesModel.fromJson(json['names']) : null,
        category: json['category'] != null
            ? CategoryModel.fromJson(json['category'])
            : null,
        stats: json['stats'], // يمكنك تخصيصه كما هو مطلوب
        realestateFeatures: json['realestateFeatures'] != null
            ? List<String>.from(json['realestateFeatures'])
            : null,
        features: json['features'] != null
            ? List<String>.from(json['features'])
            : null,
        name: json['name'] ?? "");
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'sortingIndex': sortingIndex,
      'isActive': isActive,
      'isDeleted': isDeleted,
      'image': image,
      'names': names,
      'category':
          category?.toJson(), // استخدام '?' للتأكد من أن category ليست null
      'stats': stats,
      'realestateFeatures': realestateFeatures,
      'features': features,
      'name': name
    };
  }
}
