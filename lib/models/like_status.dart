enum LikeStatus {
  initial,
  isLiking,
  hasLiked,
  hasError;

  bool get liking => this == LikeStatus.isLiking;

  bool get error => this == LikeStatus.hasError;

  bool get liked => this == LikeStatus.hasLiked;

  bool get isInitial => this == LikeStatus.initial;
}
