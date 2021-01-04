class ProfileDetailResponseModel {
  int status;
  bool acknowledge;
  ProfileDetailModel data;
  String info;

  ProfileDetailResponseModel(
      {this.status, this.acknowledge, this.data, this.info});

  ProfileDetailResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    acknowledge = json['acknowledge'];
    data = json['data'] != null ? new ProfileDetailModel.fromJson(json['data']) : null;
    info = json['info'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['acknowledge'] = this.acknowledge;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    data['info'] = this.info;
    return data;
  }
}

class ProfileDetailModel {
  String avatarUrl;
  String name;
  String location;
  int followers;
  int likes;
  int following;

  ProfileDetailModel(
      {this.avatarUrl,
        this.name,
        this.location,
        this.followers,
        this.likes,
        this.following});

  ProfileDetailModel.fromJson(Map<String, dynamic> json) {
    avatarUrl = json['avatar_url'];
    name = json['name'];
    location = json['location'];
    followers = json['followers'];
    likes = json['likes'];
    following = json['following'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['avatar_url'] = this.avatarUrl;
    data['name'] = this.name;
    data['location'] = this.location;
    data['followers'] = this.followers;
    data['likes'] = this.likes;
    data['following'] = this.following;
    return data;
  }
}
