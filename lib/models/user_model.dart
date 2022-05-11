class UserModel {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? username;
  String? profilePhotoUrl;
  String? token;

  UserModel({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.username,
    this.profilePhotoUrl,
    this.token
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    email = json["email"];
    phone = json["phone"];
    username = json["username"];
    profilePhotoUrl = json["profile_photo_url"];
    token = json["token"];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'username': username,
      'profile_photo_url': profilePhotoUrl,
      'token': token
    };
  }
}
