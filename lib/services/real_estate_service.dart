import 'package:dio/dio.dart';
import 'package:real_estate_app/models/categoryModel.dart';
import 'package:real_estate_app/models/cityModel.dart';
import 'package:real_estate_app/models/realEstatesModel.dart';

class RealEstateService {
  final Dio _dio = Dio();

  Future<List<RealEstateModel>> getRealEstates({
    String? cityId,
    String? offerType,
    String? subCategoryId,
    int pageSize = 10,
    int pageNumber = 1,
  }) async {
    try {
      final response = await _dio.get(
        'https://v3.ibaity.com/api/client/Realestate',
        queryParameters: {
          'CityId': cityId,
          'OfferType': offerType,
          'SubCategoryId': subCategoryId,
          'PageSize': pageSize,
          'PageNumber': pageNumber,
        },
      );
      if (response.statusCode == 200) {
        return (response.data["payload"] as List)
            .map((item) => RealEstateModel.fromJson(item))
            .toList();
      } else {
        print(response.statusCode);
        return [];
      }
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<RealEstateModel?> getRealEstateDetails(String id) async {
    try {
      final response =
          await _dio.get('https://v3.ibaity.com/api/client/Realestate/$id');
      if (response.statusCode == 200) {
        return RealEstateModel.fromJson(response.data["payload"]);
      } else {
        print(response.statusCode);
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }
///////////////////////////////////////////////////////////////////////////////

  Future<List<CategoryModel>> getCategories() async {
    try {
      final response = await _dio.get(
        'https://v3.ibaity.com/api/dashboard/Category',
        queryParameters: {},
      );
      if (response.statusCode == 200) {
        return (response.data["payload"] as List)
            .map((item) => CategoryModel.fromJson(item))
            .toList();
      } else {
        print(response.statusCode);
        return [];
      }
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<CategoryModel?> getCategory(String id) async {
    // try {
    final response =
        await _dio.get('https://v3.ibaity.com/api/dashboard/Category/$id');
    if (response.statusCode == 200) {
      return CategoryModel.fromJson(response.data["payload"]);
    } else {
      print(response.statusCode);
      return null;
    }
    // } catch (e) {
    //   print(e);
    //   return null;
    // }
  }
///////////////////////////////////////////////////////////////////////////////

  Future<List<CityModel>> getCities() async {
    try {
      final response = await _dio.get(
        'https://v3.ibaity.com/api/v1/dashboard/City',
        queryParameters: {},
      );
      if (response.statusCode == 200) {
        return (response.data["payload"] as List)
            .map((item) => CityModel.fromJson(item))
            .toList();
      } else {
        print(response.statusCode);
        return [];
      }
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<CityModel?> getCity(String id) async {
    try {
      final response =
          await _dio.get('https://v3.ibaity.com/api/v1/dashboard/City/$id');
      if (response.statusCode == 200) {
        return CityModel.fromJson(response.data["payload"]);
      } else {
        print(response.statusCode);
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }
}
