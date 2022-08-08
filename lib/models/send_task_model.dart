class SendTaskModel {
  Response? response;
  String? status;
  String? message;

  SendTaskModel({this.response, this.status, this.message});

  SendTaskModel.fromJson(Map<String, dynamic> json) {
    response = json['response'] != null
        ?  Response.fromJson(json['response'])
        : null;
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    if (this.response != null) {
      data['response'] = this.response!.toJson();
    }
    data['status'] = this.status;
    data['message'] = this.message;
    return data;
  }
}

class Response {
  int? userId;
  String? title;
  String? description;
  String? startDate;
  String? endDate;
  String? updatedAt;
  String? createdAt;
  int? id;
  String? imageUrl;
  String? voiceUrl;

  Response(
      {this.userId,
        this.title,
        this.description,
        this.startDate,
        this.endDate,
        this.updatedAt,
        this.createdAt,
        this.id,
        this.imageUrl,
        this.voiceUrl});

  Response.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    title = json['title'];
    description = json['description'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
    imageUrl = json['image_url'];
    voiceUrl = json['voice_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['title'] = this.title;
    data['description'] = this.description;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    data['image_url'] = this.imageUrl;
    data['voice_url'] = this.voiceUrl;
    return data;
  }
}