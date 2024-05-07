import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:localloud/models/post_model.dart';

import '../services/post_service.dart';
import '../utils/shared_preferences_helper.dart';

class PostController extends ChangeNotifier {
  final _postService = PostService();
  final _sharedPreferenceHelper = SharedPreferencesHelper();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  set isLoading(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }

  List<PostModel> _posts = [];
  List<PostModel> get posts => _posts;

  set posts(List<PostModel> posts) {
    _posts = posts;
    notifyListeners();
  }

  String _postType = "post";
  String get postType => _postType;

  set postType(String postType) {
    _postType = postType;
    notifyListeners();
  }

  Future<bool> createPost(String postContent) async {
    isLoading = true;
    try {
      // Get user id
      final user = await _sharedPreferenceHelper.getId();
      // Create post
      final newPost = await _postService.createPost(postContent, user!);
      if (newPost != null) {
        posts.add(newPost);
        return true;
      }
      return false;
    } catch (e) {
      log("Error creating post: $e --> PostController.createPost");
      rethrow;
    } finally {
      isLoading = false;
    }
  }

  Future<void> getPosts() async {
    isLoading = true;
    try {
      final posts = await _postService.getAllPosts();
      if (posts != null) {
        List<PostModel> nonEmptyPosts = [];
        for (var post in posts) {
          if (post.postContent!.isNotEmpty) {
            nonEmptyPosts.add(post);
          }
        }
        this.posts = nonEmptyPosts;
      }
    } catch (e) {
      log("Error getting posts: $e --> PostController.getPosts");
    } finally {
      isLoading = false;
    }
  }

  Future<void> deletePost(int postId) async {
    isLoading = true;
    try {
      final response = await _postService.deletePost(postId);
      if (response) {
        posts.removeWhere((element) => element.id == postId);
      }
    } catch (e) {
      log("Error deleting post: $e --> PostController.deletePost");
    } finally {
      isLoading = false;
    }
  }

  Future<void> upVotePost(int postId) async {
    isLoading = true;
    try {
      final post = await _postService.upVotePost(postId);
      if (post != null) {
        final index = posts.indexWhere((element) => element.id == post.id);
        posts[index].upvotes = post.upvotes;
      }
    } catch (e) {
      log("Error upvoting post: $e --> PostController.upVotePost");
    } finally {
      isLoading = false;
    }
  }

  Future<void> downVotePost(int postId) async {
    isLoading = true;
    try {
      final post = await _postService.downVotePost(postId);
      if (post != null) {
        final index = posts.indexWhere((element) => element.id == post.id);
        posts[index].downvotes = post.downvotes;
      }
    } catch (e) {
      log("Error downvoting post: $e --> PostController.downVotePost");
    } finally {
      isLoading = false;
    }
  }

  Future<bool> createPoll(PostModel options) async {
    isLoading = true;
    try {
      // Get user id
      final userId = await _sharedPreferenceHelper.getId();
      // create poll
      final post = await _postService.createPoll(userId!, options);
      if (post != null) {
        getPosts();
        return true;
      }
      return false;
    } catch (e) {
      log("Error creating poll: $e --> PostController.createPoll");
      return false;
    } finally {
      isLoading = false;
    }
  }

  Future<void> votePoll(int postId, String option) async {
    isLoading = true;
    try {
      final post = await _postService.votePoll(postId, option);
      if (post != null) {
        final index = posts.indexWhere((element) => element.id == post.id);
        if (option == "A") {
          posts[index].pollAVotes = post.pollAVotes;
        } else if (option == "B") {
          posts[index].pollBVotes = post.pollBVotes;
        } else if (option == "C") {
          posts[index].pollCVotes = post.pollCVotes;
        } else if (option == "D") {
          posts[index].pollDVotes = post.pollDVotes;
        }
      }
    } catch (e) {
      log("Error voting poll: $e --> PostController.votePoll");
    } finally {
      isLoading = false;
    }
  }

  PostController() {
    getPosts();
  }
}
