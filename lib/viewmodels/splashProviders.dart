import 'dart:convert'; // لتشفير البيانات إلى JSON
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:real_estate_app/main.dart';
import 'package:real_estate_app/models/categoryModel.dart';
import 'package:real_estate_app/models/cityModel.dart';
import '../services/real_estate_service.dart';

final realEstateServiceProvider = Provider<RealEstateService>((ref) {
  return RealEstateService();
});

// FutureProvider لجلب جميع العقارات
final citiesProvider = FutureProvider<List<CityModel>>((ref) async {
  final realEstateService = ref.watch(realEstateServiceProvider);
  final cities = await realEstateService.getCities();

  // حفظ البيانات في SharedPreferences بتنسيق JSON
  final citiesJson = jsonEncode([for (CityModel c in cities) c.toJson()]);
  SharedPrefs.saveData('cities', citiesJson);

  return cities;
});

final categoriesProvider = FutureProvider<List<CategoryModel>>((ref) async {
  final realEstateService = ref.watch(realEstateServiceProvider);
  final categories = await realEstateService.getCategories();

  // حفظ البيانات في SharedPreferences بتنسيق JSON
  final categoriesJson =
      jsonEncode([for (CategoryModel c in categories) c.toJson()]);
  SharedPrefs.saveData('categories', categoriesJson);

  return categories;
});

// قراءة قائمة المدن من SharedPreferences
final readCitiesProvider = Provider<List<CityModel>>((ref) {
  final citiesString = SharedPrefs.getData('cities');
  if (citiesString != null) {
    final List<dynamic> citiesList = jsonDecode(citiesString);
    return citiesList.map((cityJson) => CityModel.fromJson(cityJson)).toList();
  }
  return []; // إذا لم تكن البيانات متاحة، تعود قائمة فارغة
});

// قراءة قائمة التصنيفات من SharedPreferences
final readCategoriesProvider = Provider<List<CategoryModel>>((ref) {
  final categoriesString = SharedPrefs.getData('categories');
  if (categoriesString != null) {
    final List<dynamic> categoriesList = jsonDecode(categoriesString);

    return categoriesList
        .map((categoryJson) => CategoryModel.fromJson(categoryJson))
        .toList();
  }
  return []; // إذا لم تكن البيانات متاحة، تعود قائمة فارغة
});

final citySelectedProvider = StateProvider<int>((ref) => 0);
final categorySelectedProvider = StateProvider<int>((ref) => 0);
final typeSelectedProvider = StateProvider<int>((ref) => 0);
final subCategorySelectedProvider = StateProvider<int>((ref) => 0);
