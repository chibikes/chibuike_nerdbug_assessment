import 'package:chibuike_nerdbug_assessment/view_model/posts_bloc.dart';
import 'package:chibuike_nerdbug_assessment/view_model/posts_state.dart';
import 'package:chibuike_nerdbug_assessment/views/pages/posts_detail_page.dart';
import 'package:chibuike_nerdbug_assessment/views/widgets/post_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostsPage extends StatelessWidget {
  const PostsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<PostsBloc, PostsState>(
        builder: (context, state) {
          if (state.loadingStatus.loading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state.loadingStatus.error) {
            return const Center(child: Text('Something went wrong'));
          }
          return ListView.separated(
            itemBuilder: (__, index) {
              return BlocBuilder<PostsBloc, PostsState>(
                builder: (context, state) {
                  final post = state.posts[index];
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => PostsDetailPage(post: post),
                        ),
                      );
                    },
                    child: PostCard(post: post),
                  );
                },
              );
            },
            separatorBuilder: (__, index) => const Divider(),
            itemCount: state.posts.length,
          );
        },
        listener: (context, state) {},
      ),
    );
  }
}
