import 'package:chibuike_nerdbug_assessment/post_repository/api_post_repository.dart';
import 'package:chibuike_nerdbug_assessment/view_model/posts_bloc.dart';
import 'package:chibuike_nerdbug_assessment/view_model/posts_event.dart';
import 'package:chibuike_nerdbug_assessment/views/pages/posts_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Posts App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: BlocProvider(
        create: (context) => PostsBloc(ApiPostRepository())..add(GetPosts()),
        child: const PostsPage(),
      ),
    );
  }
}
