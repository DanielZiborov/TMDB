import 'package:flutter/material.dart';
import 'package:themoviedb/Theme/app_colors.dart';
import 'package:themoviedb/widgets/auth/auth_widget.dart';
import 'package:themoviedb/widgets/main_screen/main_screen_widget.dart';
import 'package:themoviedb/widgets/movie_details.widget/movie_details_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TMDB',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.mainDarcBlue,
          foregroundColor: AppColors.mainTextWhite,
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: AppColors.mainDarcBlue,
          selectedItemColor: AppColors.mainTextWhite,
          unselectedItemColor: Colors.grey,
        ),
      ),
      initialRoute: '/auth',
      routes: {
        '/auth': (context) => const AuthWidget(),
        '/main_screen': (context) => const MainScreenWidget(),
        '/main_screen/movie_details': (context) {
          final arguments = ModalRoute.of(context)?.settings.arguments as int;
          if (arguments is int) {
            return MovieDetailsWidget(movieId: arguments);
          }
          else{
            return const MovieDetailsWidget(movieId: 0);
          }
        },
      },
    );
  }
}
