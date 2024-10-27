class NamesModel {
  final String? enUS;
  final String? arIQ;
  final String? kuIQ;

  NamesModel({
    this.enUS,
    this.arIQ,
    this.kuIQ,
  });

  factory NamesModel.fromJson(Map<String, dynamic> json) {
    return NamesModel(
      enUS: json['en-US'],
      arIQ: json['ar-IQ'],
      kuIQ: json['ku-IQ'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'en-US': enUS,
      'ar-IQ': arIQ,
      'ku-IQ': kuIQ,
    };
  }
}
