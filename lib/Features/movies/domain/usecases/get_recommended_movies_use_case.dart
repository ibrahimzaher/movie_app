import 'package:dartz/dartz.dart';
import 'package:movie_app/Features/movies/domain/entities/movie.dart';
import 'package:movie_app/Features/movies/domain/repositories/movies_repository.dart';
import 'package:movie_app/core/errors/failures.dart';

class GetRecommendedMoviesUseCase {
  final MoviesRepository moviesRepository;

  GetRecommendedMoviesUseCase({required this.moviesRepository});

  Future<Either<Failure, List<Movie>>> call() async {
    return moviesRepository.getRecommendedMovies();
  }
}
