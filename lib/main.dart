import 'package:appnetflix/core/api/api_url.dart';
import 'package:appnetflix/presentation/screens/home_screen.dart';
import 'package:appnetflix/presentation/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'logic/now_playing_bloc/cubit.dart';
import 'logic/popular_bloc/cubit.dart';
import 'logic/top_rated_bloc/cubit.dart';

void main() {
  if (ApiUrl.apiKey.isEmpty) {
    debugPrint('TMDB_API_KEY is not set. Run with --dart-define=TMDB_API_KEY=your_key');
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: SplashScreen(),
    );
  }
}
