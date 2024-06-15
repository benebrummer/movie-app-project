enum MediaType {
  movie,
  tv,
}

extension MediaTypeExtension on MediaType {
  String get name {
    switch (this) {
      case MediaType.movie:
        return 'movie';
      case MediaType.tv:
        return 'tv';
      default:
        return '';
    }
  }
}
