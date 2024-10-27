class UserModel {
  String? firstName;
  String? lastName;
  String? image;
  String? email;
  String? phoneNumber;
  int? realestateCount;
  String? id;
  String? username;

  UserModel({
    this.firstName,
    this.lastName,
    this.image,
    this.email,
    this.phoneNumber,
    this.realestateCount,
    this.id,
    this.username,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      firstName: json['firstName'],
      lastName: json['lastName'],
      image: json['image'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
      realestateCount: json['realestateCount'],
      id: json['id'],
      username: json['username'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'image': image,
      'email': email,
      'phoneNumber': phoneNumber,
      'realestateCount': realestateCount,
      'id': id,
      'username': username,
    };
  }
}
