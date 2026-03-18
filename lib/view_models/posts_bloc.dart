import 'package:bloc/bloc.dart';
import 'package:chibuike_nerdbug_assessment/view_models/posts_event.dart';
import 'package:chibuike_nerdbug_assessment/view_models/posts_state.dart';
import '../models/like_status.dart';
import '../models/loading_status.dart';
import '../repositories/post_repository/post_repository.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  final PostRepository _postRepository;

  PostsBloc(PostRepository postRepository)
    : _postRepository = postRepository,
      super(PostsState(loadingStatus: LoadingStatus.initial)) {
    on<GetPosts>((event, emit) async {
      emit(state.copyWith(loadingStatus: LoadingStatus.isLoading));
      try {
        final posts = await _postRepository.getPosts();
        emit(
          state.copyWith(loadingStatus: LoadingStatus.hasPosts, posts: posts),
        );
      } catch (e) {
        print('something went wrong: $e');
        emit(state.copyWith(loadingStatus: LoadingStatus.hasError));
      }
    });

    on<LikePost>((event, emit) {
      emit(state.copyWith(likedStatus: LikeStatus.isLiking));
      final updatedPosts = state.posts.map((post) {
        return post.id == event.id
            ? post.copyWith(isLiked: !post.isLiked) // toggle
            : post;
      }).toList();

      emit(
        state.copyWith(
          posts: [...updatedPosts],
          likedStatus: LikeStatus.hasLiked,
        ),
      );
    });
  }
}
