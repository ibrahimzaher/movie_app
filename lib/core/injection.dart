import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:movie_app/Features/movies/data/data_sources/movies_remote_data_source.dart';
import 'package:movie_app/Features/movies/data/repositories/movies_repository_impl.dart';
import 'package:movie_app/Features/movies/domain/repositories/movies_repository.dart';
import 'package:movie_app/Features/movies/domain/usecases/get_category_movies_names_use_case.dart';
import 'package:movie_app/Features/movies/domain/usecases/get_category_movies_use_case.dart';
import 'package:movie_app/Features/movies/domain/usecases/get_movie_details_use_case.dart';
import 'package:movie_app/Features/movies/domain/usecases/get_popular_release_movies_use_case.dart';
import 'package:movie_app/Features/movies/domain/usecases/get_recommended_movies_use_case.dart';
import 'package:movie_app/Features/movies/domain/usecases/get_similar_movies_use_case.dart';
import 'package:movie_app/Features/movies/domain/usecases/search_by_movie_name_use_case.dart';
import 'package:movie_app/Features/movies/presentation/bloc/movies_bloc.dart';
import 'package:movie_app/core/network/network_info.dart';

final sl = GetIt.instance;
init() async {
  //bloc
  sl.registerFactory<MoviesBloc>(() => MoviesBloc(
      getSimilarMovies: sl(),
      getMovieDetails: sl(),
      getRecommendedMovies: sl(),
      getPopularReleaseMovies: sl()));
  //repository
  sl.registerLazySingleton<MoviesRepository>(() =>
      MoviesRepositoryImpl(moviesRemoteDataSource: sl(), networkInfo: sl()));
  //data sources
  sl.registerLazySingleton<MoviesRemoteDataSource>(
      () => MoviesRemoteDataSourceWithHttp(client: sl()));
  //use cases
  sl.registerLazySingleton(
      () => GetSimilarMoviesUseCase(moviesRepository: sl()));
  sl.registerLazySingleton(
      () => GetMovieDetailsUseCase(moviesRepository: sl()));
  sl.registerLazySingleton(
      () => GetRecommendedMoviesUseCase(moviesRepository: sl()));
  sl.registerLazySingleton(
      () => GetCategoryMoviesNamesUseCase(moviesRepository: sl()));
  sl.registerLazySingleton(
      () => GetCategoryMoviesUseCase(moviesRepository: sl()));
  sl.registerLazySingleton(
      () => GetPopularReleaseMoviesUseCase(moviesRepository: sl()));
  sl.registerLazySingleton(
      () => SearchByMovieNameUseCase(moviesRepository: sl()));
  //Core
  sl.registerLazySingleton<NetworkInfo>(() =>
      NetworkInfoImpl(internetConnectionChecker: InternetConnectionChecker()));
  //External
  sl.registerLazySingleton(() => http.Client());
}
