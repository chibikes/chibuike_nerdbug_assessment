import 'dart:convert';
import 'package:chibuike_nerdbug_assessment/repositories/post_repository/post_repository.dart';
import 'package:http/http.dart' as http;

import '../../api_client.dart';
import '../../models/post.dart';

class ApiPostRepository extends PostRepository {
  final ApiClient _apiClient;

  ApiPostRepository({required ApiClient apiClient}) : _apiClient = apiClient;

  @override
  Future<List<Post>> getPosts() {
    return _apiClient.get(
      '/posts',
      mapper: (json) => (json as List).map((e) => Post.fromJson(e)).toList(),
    );
  }
}
