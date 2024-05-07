class PostModel {
  int? id;
  String? postContent;
  bool? isPoll;
  String? pollA;
  String? pollB;
  String? pollC;
  String? pollD;
  int? pollAVotes;
  int? pollBVotes;
  int? pollCVotes;
  int? pollDVotes;
  int? upvotes;
  int? downvotes;
  User? user;

  PostModel(
      {this.id,
      this.postContent,
      this.isPoll,
      this.pollA,
      this.pollB,
      this.pollC,
      this.pollD,
      this.pollAVotes,
      this.pollBVotes,
      this.pollCVotes,
      this.pollDVotes,
      this.upvotes,
      this.downvotes,
      this.user});

  PostModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    postContent = json['postContent'];
    isPoll = json['isPoll'];
    pollA = json['pollA'];
    pollB = json['pollB'];
    pollC = json['pollC'];
    pollD = json['pollD'];
    pollAVotes = json['pollAVotes'];
    pollBVotes = json['pollBVotes'];
    pollCVotes = json['pollCVotes'];
    pollDVotes = json['pollDVotes'];
    upvotes = json['upvotes'];
    downvotes = json['downvotes'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['postContent'] = postContent;
    data['isPoll'] = isPoll;
    data['pollA'] = pollA;
    data['pollB'] = pollB;
    data['pollC'] = pollC;
    data['pollD'] = pollD;
    data['pollAVotes'] = pollAVotes;
    data['pollBVotes'] = pollBVotes;
    data['pollCVotes'] = pollCVotes;
    data['pollDVotes'] = pollDVotes;
    data['upvotes'] = upvotes;
    data['downvotes'] = downvotes;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  String? username;
  String? name;

  User({this.id, this.username, this.name});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['username'] = username;
    data['name'] = name;
    return data;
  }
}
