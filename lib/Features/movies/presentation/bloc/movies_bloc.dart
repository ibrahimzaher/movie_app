import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/Features/movies/domain/entities/movie.dart';
import 'package:movie_app/Features/movies/domain/usecases/get_movie_details_use_case.dart';
import 'package:movie_app/Features/movies/domain/usecases/get_popular_release_movies_use_case.dart';
import 'package:movie_app/Features/movies/domain/usecases/get_recommended_movies_use_case.dart';
import 'package:movie_app/Features/movies/domain/usecases/get_similar_movies_use_case.dart';
import 'package:movie_app/core/strings/failures.dart';

part 'movies_event.dart';
part 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetMovieDetailsUseCase getMovieDetails;
  final GetRecommendedMoviesUseCase getRecommendedMovies;
  final GetPopularReleaseMoviesUseCase getPopularReleaseMovies;
  final GetSimilarMoviesUseCase getSimilarMovies;
  MoviesBloc({
    required this.getSimilarMovies,
    required this.getMovieDetails,
    required this.getRecommendedMovies,
    required this.getPopularReleaseMovies,
  }) : super(MoviesInitial()) {
    on<MoviesEvent>((event, emit) async {
      if (event is GetPopularReleaseMoviesEvent) {
        emit(const LoadingMoviesState());
        final either = await getPopularReleaseMovies();
        either.fold(
            (l) =>
                emit(const ErrorMoviesState(message: SERVER_FAILURE_MESSAGE)),
            (r) => emit(LoadedPopularReleaseMoviesState(moviesPopular: r)));
      } else if (event is GetRecommendedMoviesEvent) {
        emit(const LoadingMoviesState());
        final either = await getRecommendedMovies();
        either.fold(
            (l) =>
                emit(const ErrorMoviesState(message: SERVER_FAILURE_MESSAGE)),
            (r) => emit(LoadedRecommendedMoviesState(moviesRecommended: r)));
      } else if (event is GetMovieDetailsEvent) {
        emit(const LoadingMoviesState());
        final either = await getMovieDetails(event.movieId);
        either.fold(
            (l) =>
                emit(const ErrorMoviesState(message: SERVER_FAILURE_MESSAGE)),
            (r) => emit(LoadedMovieDetailsState(movie: r)));
      } else if (event is GetSimilarMoviesEvent) {
        emit(const LoadingMoviesState());
        final either = await getSimilarMovies(event.movieId);
        either.fold(
            (l) =>
                emit(const ErrorMoviesState(message: SERVER_FAILURE_MESSAGE)),
            (r) => emit(LoadedSimilarMoviesState(moviesSimilar: r)));
      }
    });
  }
}
