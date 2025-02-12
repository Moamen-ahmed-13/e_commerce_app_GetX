class UserModel {
  String? name, email, userId, profilePic;
  UserModel({this.name, this.email, this.userId, this.profilePic});

  UserModel.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      return;
    }
    name = json['name'];
    email = json['email'];
    userId = json['userId'];
    profilePic = json['profilePic'];
  }
  toJson() {
    return {
      'name': name,
      'email': email,
      'userId': userId,
      'profilePic': profilePic,
    };
  }
}
