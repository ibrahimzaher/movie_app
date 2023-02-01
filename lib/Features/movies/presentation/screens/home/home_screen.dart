import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/Features/movies/presentation/bloc/movies_bloc.dart';
import 'package:movie_app/core/app_theme.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesBloc, MoviesState>(
      builder: (context, state) {
        return Container(
          color: greyColor,
          width: double.infinity,
          height: double.infinity,
        );
      },
    );
  }
}
