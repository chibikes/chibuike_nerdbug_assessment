import 'package:chibuike_nerdbug_assessment/models/post.dart';

abstract class PostRepository {
  Future<List<Post>> getPosts();
}