class RegisterHub
{
  String? status;
  User? user;
  Authorisation? authorisation;
  RegisterHub({this.status, this.user, this.authorisation});
  RegisterHub.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    authorisation = json['authorisation'] != null
        ? new Authorisation.fromJson(json['authorisation'])
        : null;
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    if (this.authorisation != null) {
      data['authorisation'] = this.authorisation!.toJson();
    }
    return data;
  }
}
class User {
  int? id;
  String? name;
  String? email;
  Null? emailVerifiedAt;
  Null? profileImage;
  String? createdAt;
  String? updatedAt;
  String? profileUrl;
  User(
      {this.id,
        this.name,
        this.email,
        this.emailVerifiedAt,
        this.profileImage,
        this.createdAt,
        this.updatedAt,
        this.profileUrl});
  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    profileImage = json['profile_image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    profileUrl = json['profile_url'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['profile_image'] = this.profileImage;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['profile_url'] = this.profileUrl;
    return data;
  }
}
class Authorisation {
  String? token;
  String? type;

  Authorisation({this.token, this.type});

  Authorisation.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['type'] = this.type;
    return data;
  }
}