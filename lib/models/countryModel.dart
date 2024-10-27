class CountryModel {
  String? id;
  String? name;

  CountryModel({this.id, this.name});

  factory CountryModel.fromJson(Map<String, dynamic> json) {
    return CountryModel(
      id: json['id'] as String?,
      name: json['name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}
