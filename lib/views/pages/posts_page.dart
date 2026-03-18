import 'package:chibuike_nerdbug_assessment/views/pages/posts_detail_page.dart';
import 'package:chibuike_nerdbug_assessment/views/widgets/post_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../view_models/posts_bloc.dart';
import '../../view_models/posts_event.dart';
import '../../view_models/posts_state.dart';

class PostsPage extends StatelessWidget {
  const PostsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Nerdbug Posts')),
      body: BlocConsumer<PostsBloc, PostsState>(
        builder: (context, state) {
          if (state.loadingStatus.loading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state.loadingStatus.error) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.error_outline,
                    size: 48,
                    color: Colors.grey.shade400,
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Something went wrong',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF1A1A2E),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Please check your connection and try again',
                    style: TextStyle(fontSize: 13, color: Colors.grey),
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton.icon(
                    onPressed: () => context.read<PostsBloc>().add(GetPosts()),
                    icon: const Icon(Icons.refresh),
                    label: const Text('Try Again'),
                  ),
                ],
              ),
            );
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
