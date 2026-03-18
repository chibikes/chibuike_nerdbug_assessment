import 'package:chibuike_nerdbug_assessment/models/like_status.dart';
import 'package:chibuike_nerdbug_assessment/models/loading_status.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../models/post.dart';

class PostsState extends Equatable {
  final List<Post> posts;
  final LoadingStatus loadingStatus;
  final LikeStatus likedStatus;

  PostsState({
    this.posts = const [],
    this.loadingStatus = LoadingStatus.initial,
    this.likedStatus = LikeStatus.initial,
  });

  PostsState copyWith({
    final List<Post>? posts,
    final LoadingStatus? loadingStatus,
    final LikeStatus? likedStatus,
  }) {
    return PostsState(
      posts: posts ?? this.posts,
      loadingStatus: loadingStatus ?? this.loadingStatus,
      likedStatus: likedStatus ?? this.likedStatus,
    );
  }

  @override
  List<Object?> get props => [posts, loadingStatus, likedStatus];
}
