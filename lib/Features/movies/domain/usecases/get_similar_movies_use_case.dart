import 'package:dartz/dartz.dart';
import 'package:movie_app/Features/movies/domain/entities/movie.dart';
import 'package:movie_app/Features/movies/domain/repositories/movies_repository.dart';
import 'package:movie_app/core/errors/failures.dart';

class GetSimilarMoviesUseCase {
  final MoviesRepository moviesRepository;

  GetSimilarMoviesUseCase({required this.moviesRepository});
  Future<Either<Failure, List<Movie>>> call(int movieId) async {
    return moviesRepository.getSimilarMovies(movieId);
  }
}
