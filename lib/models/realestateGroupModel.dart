class RealestateGroupModel {
  final int? realestateAgency;
  final int? buildingComplex;
  final int? constructionCompany;

  RealestateGroupModel({
    this.realestateAgency,
    this.buildingComplex,
    this.constructionCompany,
  });

  factory RealestateGroupModel.fromJson(Map<String, dynamic> json) {
    return RealestateGroupModel(
      realestateAgency: json['realestateAgency'] ?? 0, // تعيين قيمة افتراضية
      buildingComplex: json['buildingComplex'] ?? 0, // تعيين قيمة افتراضية
      constructionCompany:
          json['constructionCompany'] ?? 0, // تعيين قيمة افتراضية
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'realestateAgency': realestateAgency,
      'buildingComplex': buildingComplex,
      'constructionCompany': constructionCompany,
    };
  }
}
