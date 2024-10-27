import 'package:real_estate_app/models/realEstatesModel.dart';
import 'package:real_estate_app/models/realestateGroupModel.dart';

class StatsModel {
  final int districts;
  final int subDistricts;
  final RealestateGroupModel realestateGroup;
  final RealEstateModel realestates;

  StatsModel({
    required this.districts,
    required this.subDistricts,
    required this.realestateGroup,
    required this.realestates,
  });

  factory StatsModel.fromJson(Map<String, dynamic> json) {
    return StatsModel(
      districts: json['districts'] ?? 0,
      subDistricts: json['subDistricts'] ?? 0,
      realestateGroup: json['realestateGroup'] != null
          ? RealestateGroupModel.fromJson(json['realestateGroup'])
          : RealestateGroupModel(),
      realestates: RealEstateModel.fromJson(json['realestates']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'districts': districts,
      'subDistricts': subDistricts,
      'realestateGroup': realestateGroup.toJson(),
      'realestates': realestates.toJson(),
    };
  }
}
