import 'package:real_estate_app/models/countryModel.dart';
import 'package:real_estate_app/models/namesModel.dart';
import 'package:real_estate_app/models/statsModel.dart';

class CityModel {
  final NamesModel? names;
  final StatsModel? stats;
  final bool? isActive;
  final bool? isDeleted;
  final String? name;
  final String? id;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final double? lat;
  final double? lng;
  final int? zoom;
  final List? polygon;
  CountryModel? country;

  CityModel(
      {this.names,
      this.stats,
      this.isActive,
      this.isDeleted,
      this.name,
      this.id,
      this.createdAt,
      this.updatedAt,
      this.lat,
      this.lng,
      this.zoom,
      this.polygon,
      this.country});

  factory CityModel.fromJson(Map<String, dynamic> json) {
    return CityModel(
      names: json['names'] != null ? NamesModel.fromJson(json['names']) : null,
      stats: json['stats'] != null ? StatsModel.fromJson(json['stats']) : null,
      isActive: json['isActive'],
      isDeleted: json['isDeleted'],
      name: json['name'],
      id: json['id'],
      createdAt:
          json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      updatedAt:
          json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
      lat: json['lat'] ?? 0.0,
      lng: json['lng'] ?? 0.0,
      zoom: json['zoom'],
      polygon: json['polygon'] != null
          ? (json['polygon'] as List)
              .map((coords) => (coords).map((c) => c).toList())
              .toList()
          : null,
      country: json['country'] != null
          ? CountryModel.fromJson(json['country'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'names': names!.toJson(),
      'stats': stats!.toJson(),
      'isActive': isActive,
      'isDeleted': isDeleted,
      'name': name,
      'id': id,
      'createdAt': createdAt!.toIso8601String(),
      'updatedAt': updatedAt!.toIso8601String(),
      'lat': lat,
      'lng': lng,
      'zoom': zoom,
      'polygon':
          polygon!.map((coords) => coords.map((c) => c).toList()).toList(),
      'country': country?.toJson(),
    };
  }
}
