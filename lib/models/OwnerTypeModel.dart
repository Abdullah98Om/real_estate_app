class OwnerTypeModel {
  final int? realestateAgency;
  final int? buildingComplex;
  final int? constructionCompany;
  final int? customer;

  OwnerTypeModel({
    this.realestateAgency,
    this.buildingComplex,
    this.constructionCompany,
    this.customer,
  });

  factory OwnerTypeModel.fromJson(Map<String, dynamic> json) {
    return OwnerTypeModel(
      realestateAgency: json['realestateAgency'],
      buildingComplex: json['buildingComplex'],
      constructionCompany: json['constructionCompany'],
      customer: json['customer'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'realestateAgency': realestateAgency,
      'buildingComplex': buildingComplex,
      'constructionCompany': constructionCompany,
      'customer': customer,
    };
  }
}
