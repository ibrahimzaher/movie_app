import 'package:flutter/material.dart';
import 'package:movie_app/Features/movies/presentation/screens/browse/browse_view.dart';
import 'package:movie_app/Features/movies/presentation/screens/home/home_view.dart';
import 'package:movie_app/Features/movies/presentation/screens/search/search_view.dart';
import 'package:movie_app/Features/movies/presentation/screens/watch_list/watch_list_view.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({Key? key}) : super(key: key);
  static const String routeName = 'homeLayout';
  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int index = 0;
  List<Widget> views = [
    HomeView(),
    SearchView(),
    BrowseView(),
    WatchListView(),
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
