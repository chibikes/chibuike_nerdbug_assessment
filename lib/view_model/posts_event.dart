abstract class PostsEvent {

}

class GetPosts extends PostsEvent {

}

class LikePost extends PostsEvent {
  final String id;

  LikePost(this.id);
}