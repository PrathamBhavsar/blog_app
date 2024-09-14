class UserModel {
  final String id;
  final String userName;
  final String profileImage;
  final String email;

  UserModel({
    required this.id,
    required this.userName,
    required this.profileImage,
    required this.email,
  });

  // json to User object
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      userName: json['user_name'],
      profileImage: json['profile_image'],
      email: json['phone_number'],
    );
  }

  // User object to json
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_name': userName,
      'profile_image': profileImage,
      'phone_number': email,
    };
  }
}
