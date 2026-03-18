enum LoadingStatus {
  initial,
  isLoading,
  hasPosts,
  hasError;

  bool get loading => this == LoadingStatus.isLoading;

  bool get error => this == LoadingStatus.hasError;

  bool get posts => this == LoadingStatus.hasPosts;

  bool get isInitial => this == LoadingStatus.initial;
}
