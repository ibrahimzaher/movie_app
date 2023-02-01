import 'package:flutter/material.dart';
import 'package:movie_app/core/app_theme.dart';
import 'package:movie_app/home_layout.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: HomeLayout.routeName,
      routes: {
        HomeLayout.routeName: (_) => HomeLayout(),
      },
      debugShowCheckedModeBanner: false,
      theme: appTheme,
    );
  }
}
