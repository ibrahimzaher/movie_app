import 'package:dartz/dartz.dart';
import 'package:movie_app/Features/movies/domain/entities/genres.dart';
import 'package:movie_app/Features/movies/domain/repositories/movies_repository.dart';
import 'package:movie_app/core/errors/failures.dart';

class GetCategoryMoviesNamesUseCase {
  final MoviesRepository moviesRepository;

  GetCategoryMoviesNamesUseCase({required this.moviesRepository});

  Future<Either<Failure, List<Genres>>> call() async {
    return moviesRepository.getCategoryMoviesNames();
  }
}
