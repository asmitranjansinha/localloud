class PostModel {
  String? postContent;
  User? user;
  int? id;
  int? upvotes;
  int? downvotes;

  PostModel(
      {this.postContent, this.user, this.id, this.upvotes, this.downvotes});

  PostModel.fromJson(Map<String, dynamic> json) {
    postContent = json['postContent'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    id = json['id'];
    upvotes = json['upvotes'];
    downvotes = json['downvotes'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['postContent'] = postContent;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['id'] = id;
    data['upvotes'] = upvotes;
    data['downvotes'] = downvotes;
    return data;
  }
}

class User {
  int? id;
  String? username;
  String? name;
  String? email;
  int? age;

  User({this.id, this.username, this.name, this.email, this.age});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    name = json['name'];
    email = json['email'];
    age = json['age'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['username'] = username;
    data['name'] = name;
    data['email'] = email;
    data['age'] = age;
    return data;
  }
}
