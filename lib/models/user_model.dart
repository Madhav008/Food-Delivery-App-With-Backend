class User {
  int id;
  String name;
  String email;
  Null bio;
  Null imageUrl;
  Null emailVerifiedAt;
  String createdAt;
  String updatedAt;

  User(
      {this.id,
      this.name,
      this.email,
      this.bio,
      this.imageUrl,
      this.emailVerifiedAt,
      this.createdAt,
      this.updatedAt});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    bio = json['bio'];
    imageUrl = json['image_url'];
    emailVerifiedAt = json['email_verified_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  
}