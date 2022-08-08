class UpdateTaskModel {
  Response? response;
  String? status;
  String? message;

  UpdateTaskModel({this.response, this.status, this.message});

  UpdateTaskModel.fromJson(Map<String, dynamic> json) {
    response = json['response'] != null
        ? new Response.fromJson(json['response'])
        : null;
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.response != null) {
      data['response'] = this.response!.toJson();
    }
    data['status'] = this.status;
    data['message'] = this.message;
    return data;
  }
}

class Response {
  int? id;
  int? userId;
  String? title;
  String? description;
  Null? image;
  Null? voice;
  String? startDate;
  String? endDate;
  String? status;
  String? createdAt;
  String? updatedAt;
  String? imageUrl;
  String? voiceUrl;

  Response(
      {this.id,
        this.userId,
        this.title,
        this.description,
        this.image,
        this.voice,
        this.startDate,
        this.endDate,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.imageUrl,
        this.voiceUrl});

  Response.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    title = json['title'];
    description = json['description'];
    image = json['image'];
    voice = json['voice'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    imageUrl = json['image_url'];
    voiceUrl = json['voice_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['title'] = this.title;
    data['description'] = this.description;
    data['image'] = this.image;
    data['voice'] = this.voice;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['image_url'] = this.imageUrl;
    data['voice_url'] = this.voiceUrl;
    return data;
  }
}
