class HomeResponseModel {
  int status;
  bool acknowledge;
  List<Data> data;
  String info;

  HomeResponseModel({this.status, this.acknowledge, this.data, this.info});

  HomeResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    acknowledge = json['acknowledge'];
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
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

class Data {
  Author author;
  String title;
  String date;
  String description;
  String shortDescription;
  bool isBookmark;
  bool isFavorite;
  int totalFavorite;

  Data(
      {this.author,
        this.title,
        this.date,
        this.description,
        this.shortDescription,
        this.isBookmark,
        this.isFavorite,
        this.totalFavorite});

  Data.fromJson(Map<String, dynamic> json) {
    author =
    json['author'] != null ? new Author.fromJson(json['author']) : null;
    title = json['title'];
    date = json['date'];
    description = json['description'];
    shortDescription = json['short_description'];
    isBookmark = json['is_bookmark'];
    isFavorite = json['is_favorite'];
    totalFavorite = json['total_favorite'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.author != null) {
      data['author'] = this.author.toJson();
    }
    data['title'] = this.title;
    data['date'] = this.date;
    data['description'] = this.description;
    data['short_description'] = this.shortDescription;
    data['is_bookmark'] = this.isBookmark;
    data['is_favorite'] = this.isFavorite;
    data['total_favorite'] = this.totalFavorite;
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
