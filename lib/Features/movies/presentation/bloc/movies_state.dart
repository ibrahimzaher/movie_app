part of 'movies_bloc.dart';

abstract class MoviesState extends Equatable {
  const MoviesState();
}

class MoviesInitial extends MoviesState {
  @override
  List<Object> get props => [];
}

class LoadingMoviesState extends MoviesState {
  const LoadingMoviesState();
  @override
  List<Object?> get props => [];
}

class LoadedPopularReleaseMoviesState extends MoviesState {
  final List<Movie> moviesPopular;

  const LoadedPopularReleaseMoviesState({required this.moviesPopular});
  @override
  List<Object?> get props => [moviesPopular];
}

class LoadedRecommendedMoviesState extends MoviesState {
  final List<Movie> moviesRecommended;

  const LoadedRecommendedMoviesState({required this.moviesRecommended});
  @override
  List<Object?> get props => [moviesRecommended];
}

class LoadedMovieDetailsState extends MoviesState {
  final Movie movie;

  const LoadedMovieDetailsState({required this.movie});
  @override
  List<Object?> get props => [movie];
}

class LoadedSimilarMoviesState extends MoviesState {
  final List<Movie> moviesSimilar;

  const LoadedSimilarMoviesState({required this.moviesSimilar});
  @override
  List<Object?> get props => [moviesSimilar];
}

class ErrorMoviesState extends MoviesState {
  final String message;
  const ErrorMoviesState({required this.message});
  @override
  List<Object?> get props => [message];
}
