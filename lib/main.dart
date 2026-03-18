import 'package:chibuike_nerdbug_assessment/post_repository/api_post_repository.dart';
import 'package:chibuike_nerdbug_assessment/view_model/posts_bloc.dart';
import 'package:chibuike_nerdbug_assessment/view_model/posts_event.dart';
import 'package:chibuike_nerdbug_assessment/views/pages/posts_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'api_client.dart';

void main() {
  runApp(
    BlocProvider(
      create: (context) => PostsBloc(
        ApiPostRepository(
          apiClient: ApiClient(baseUrl: 'https://jsonplaceholder.typicode.com'),
        ),
      )..add(GetPosts()),
      child: const MyApp(),
    ),
  );
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
      home: const PostsPage(),
    );
  }
}
