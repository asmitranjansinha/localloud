class UserModel {
  int? id;
  String? username;
  String? name;
  String? email;
  int? age;

  UserModel({this.id, this.username, this.name, this.email, this.age});

  UserModel.fromJson(Map<String, dynamic> json) {
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
