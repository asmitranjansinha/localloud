import 'dart:developer';

import 'package:dio/dio.dart';

import '../models/post_model.dart';
import '../utils/constants/api_constant.dart';

class PostService {
  final _apiConst = ApiConstant();

  Map<String, dynamic>? headers = {
    'Content-Type': 'application/json',
  };

  Future<PostModel?> createPost(String postContent, int userId) async {
    try {
      Response response = await _apiConst.sendApiReq.post(
        '/posts/$userId',
        data: {
          'postContent': postContent,
        },
        options: Options(headers: headers),
      );
      if (response.statusCode == 201) {
        return PostModel.fromJson(response.data);
      }
      return null;
    } catch (e) {
      log("Error Create Post: $e --> createPost(PostService)");
      rethrow;
    }
  }

  Future<List<PostModel>?> getAllPosts() async {
    try {
      List<PostModel> posts = [];
      Response response = await _apiConst.sendApiReq.get(
        '/posts',
      );
      if (response.statusCode == 200) {
        for (var post in response.data) {
          posts.add(PostModel.fromJson(post));
        }
        return posts;
      }
      return null;
    } catch (e) {
      log("Error Get All Posts: $e --> getAllPosts(PostService)");
      rethrow;
    }
  }

  Future<bool> deletePost(int id) async {
    try {
      Response response = await _apiConst.sendApiReq.delete(
        '/posts/$id',
      );
      if (response.statusCode == 200) {
        return true;
      }
      return false;
    } catch (e) {
      log("Error Delete Post: $e --> deletePost(PostService)");
      rethrow;
    }
  }

  Future<PostModel?> upVotePost(int id) async {
    try {
      Response response = await _apiConst.sendApiReq.put(
        '/posts/$id/upvote',
      );
      if (response.statusCode == 200) {
        return PostModel.fromJson(response.data);
      }
      return null;
    } catch (e) {
      log("Error Upvoting Post: $e --> upVotePost(PostService)");
      rethrow;
    }
  }

  Future<PostModel?> downVotePost(int id) async {
    try {
      Response response = await _apiConst.sendApiReq.put(
        '/posts/$id/downvote',
      );
      if (response.statusCode == 200) {
        return PostModel.fromJson(response.data);
      }
      return null;
    } catch (e) {
      log("Error Downvoting Post: $e --> downVotePost(PostService)");
      rethrow;
    }
  }

  Future<PostModel?> createPoll(int userId, PostModel options) async {
    try {
      Response response = await _apiConst.sendApiReq.post(
        '/posts/$userId/poll',
        data: {
          "postContent": options.postContent,
          "pollA": options.pollA,
          "pollB": options.pollB,
          "pollC": options.pollC,
          "pollD": options.pollD,
        },
        options: Options(headers: headers),
      );
      if (response.statusCode == 201) {
        return PostModel.fromJson(response.data);
      }
      return null;
    } catch (e) {
      log("Error Creating Poll: $e --> createPoll(PostService)");
      rethrow;
    }
  }

  Future<PostModel?> votePoll(int id, String option) async {
    try {
      Response response = await _apiConst.sendApiReq.put(
        '/posts/$id/vote-poll',
        data: {
          "option": option,
        },
      );
      if (response.statusCode == 200) {
        return PostModel.fromJson(response.data);
      }
      return null;
    } catch (e) {
      log("Error Voting Poll: $e --> votePoll(PostService)");
      rethrow;
    }
  }
}
