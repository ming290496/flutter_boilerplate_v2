class NotificationListResponseModel {
  int status;
  bool acknowledge;
  List<NotificationListModel> data;
  String info;

  NotificationListResponseModel(
      {this.status, this.acknowledge, this.data, this.info});

  NotificationListResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    acknowledge = json['acknowledge'];
    if (json['data'] != null) {
      data = new List<NotificationListModel>();
      json['data'].forEach((v) {
        data.add(new NotificationListModel.fromJson(v));
      });
    }
    info = json['info'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['acknowledge'] = this.acknowledge;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    data['info'] = this.info;
    return data;
  }
}

class NotificationListModel {
  Author author;
  String title;
  String date;

  NotificationListModel({this.author, this.title, this.date});

  NotificationListModel.fromJson(Map<String, dynamic> json) {
    author =
    json['author'] != null ? new Author.fromJson(json['author']) : null;
    title = json['title'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.author != null) {
      data['author'] = this.author.toJson();
    }
    data['title'] = this.title;
    data['date'] = this.date;
    return data;
  }
}

class Author {
  String avatarUrl;
  String name;

  Author({this.avatarUrl, this.name});

  Author.fromJson(Map<String, dynamic> json) {
    avatarUrl = json['avatar_url'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['avatar_url'] = this.avatarUrl;
    data['name'] = this.name;
    return data;
  }
}
