import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/Features/movies/presentation/bloc/movies_bloc.dart';
import 'package:movie_app/Features/movies/presentation/screens/browse/browse_screen.dart';
import 'package:movie_app/Features/movies/presentation/screens/home/home_screen.dart';
import 'package:movie_app/Features/movies/presentation/screens/search/search_screen.dart';
import 'package:movie_app/Features/movies/presentation/screens/watch_list/watch_list_screen.dart';
import 'package:movie_app/core/injection.dart' as di;

class HomeLayout extends StatefulWidget {
  const HomeLayout({Key? key}) : super(key: key);
  static const String routeName = 'homeLayout';

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int index = 0;
  List<Widget> views = [
    BlocProvider<MoviesBloc>(
      create: (context) => di.sl<MoviesBloc>(),
      child: HomeScreen(),
    ),
    SearchScreen(),
    BrowseScreen(),
    WatchListScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: views[index],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        items: [
          _bottomNavBarItem(
            iconData: Icons.home_rounded,
            label: 'HOME',
          ),
          _bottomNavBarItem(
            iconData: Icons.search,
            label: 'SEARCH',
          ),
          _bottomNavBarItem(
            iconData: Icons.movie,
            label: 'BROWSE',
          ),
          _bottomNavBarItem(
            iconData: Icons.book_outlined,
            label: 'WATCHLIST',
          ),
        ],
        onTap: (index) {
          setState(() {
            if (index == this.index) return;
            this.index = index;
          });
        },
      ),
    );
  }

  BottomNavigationBarItem _bottomNavBarItem(
      {required IconData iconData, required String label}) {
    return BottomNavigationBarItem(
      icon: Icon(
        iconData,
      ),
      label: label,
      tooltip: label,
    );
  }
}
