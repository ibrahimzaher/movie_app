import 'package:dartz/dartz.dart';
import 'package:movie_app/Features/movies/domain/entities/movie.dart';
import 'package:movie_app/Features/movies/domain/repositories/movies_repository.dart';
import 'package:movie_app/core/errors/failures.dart';

class GetMovieDetailsUseCase {
  final MoviesRepository moviesRepository;

  GetMovieDetailsUseCase({required this.moviesRepository});
  Future<Either<Failure, Movie>> call(int movieId) async {
    return moviesRepository.getMovieDetails(movieId);
  }
}
