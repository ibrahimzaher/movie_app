part of 'movies_bloc.dart';

abstract class MoviesEvent extends Equatable {
  const MoviesEvent();
}

class GetPopularReleaseMoviesEvent extends MoviesEvent {
  @override
  List<Object?> get props => [];
}

class GetRecommendedMoviesEvent extends MoviesEvent {
  @override
  List<Object?> get props => [];
}

class GetMovieDetailsEvent extends MoviesEvent {
  final int movieId;

  const GetMovieDetailsEvent({required this.movieId});
  @override
  List<Object?> get props => [movieId];
}

class GetSimilarMoviesEvent extends MoviesEvent {
  final int movieId;

  const GetSimilarMoviesEvent({required this.movieId});
  @override
  List<Object?> get props => [movieId];
}
