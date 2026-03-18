import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:chibuike_nerdbug_assessment/post_repository/post_repository.dart';
import '../models/post.dart';

class ApiPostRepository extends PostRepository {
  static const String _baseUrl = 'https://jsonplaceholder.typicode.com';

  @override
  Future<List<Post>> getPosts() async {
    final response = await http.get(
      Uri.parse('$_baseUrl/posts'),
      headers: {'User-Agent': 'Mozilla/5.0', 'Accept': 'application/json'},
    );

    if (response.statusCode == 200) {
      final List<dynamic> json = jsonDecode(response.body);
      return json.map((e) => Post.fromJson(e)).toList();
    } else {
      throw Exception('Failed to fetch posts — status ${response.statusCode}');
    }
  }
}
