import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/app_theme.dart';
import 'package:movie_app/core/my_observer.dart';
import 'package:movie_app/home_layout.dart';

import 'core/injection.dart' as di;

void main() async {
  await di.init();
  Bloc.observer = MyBlocObserver();
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
