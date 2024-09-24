import 'package:flutter/material.dart';
import 'package:themoviedb/resourses/app_images.dart';

class Movie {
  final int id;
  final String imageName;
  final String title;
  final String time;
  final String description;

  Movie({
    required this.id,
    required this.imageName,
    required this.title,
    required this.time,
    required this.description,
  });
}

class MovieListWidget extends StatefulWidget {
  const MovieListWidget({super.key});

  @override
  State<MovieListWidget> createState() => _MovieListWidgetState();
}

class _MovieListWidgetState extends State<MovieListWidget> {
  final _movies = [
    Movie(
      id: 0,
      imageName: AppImages.moviePlaceHolder,
      title: 'смертельная битва',
      time: 'April 7, 2021',
      description: 'Summer Atumn 32 Dino Sun Wolf Pig Red Blue Yellow',
    ),
    Movie(
      id: 1,
      imageName: AppImages.moviePlaceHolder,
      title: 'Прибытие',
      time: 'April 7, 2021',
      description: 'Summer Atumn 32 Dino Sun Wolf Pig Red Blue Yellow',
    ),
    Movie(
      id: 2,
      imageName: AppImages.moviePlaceHolder,
      title: 'Назад в будущее 1',
      time: 'April 7, 2021',
      description: 'Summer Atumn 32 Dino Sun Wolf Pig Red Blue Yellow',
    ),
    Movie(
      id: 3,
      imageName: AppImages.moviePlaceHolder,
      title: 'Назад в будущее 2',
      time: 'April 7, 2021',
      description: 'Summer Atumn 32 Dino Sun Wolf Pig Red Blue Yellow',
    ),
    Movie(
      id: 4,
      imageName: AppImages.moviePlaceHolder,
      title: 'Назад в будущее 3',
      time: 'April 7, 2021',
      description: 'Summer Atumn 32 Dino Sun Wolf Pig Red Blue Yellow',
    ),
    Movie(
      id: 5,
      imageName: AppImages.moviePlaceHolder,
      title: 'Человек паук',
      time: 'April 7, 2021',
      description: 'Summer Atumn 32 Dino Sun Wolf Pig Red Blue Yellow',
    ),
    Movie(
      id: 6,
      imageName: AppImages.moviePlaceHolder,
      title: 'Пиксели',
      time: 'April 7, 2021',
      description: 'Summer Atumn 32 Dino Sun Wolf Pig Red Blue Yellow',
    ),
    Movie(
      id: 7,
      imageName: AppImages.moviePlaceHolder,
      title: 'Джентельмены',
      time: 'April 7, 2021',
      description: 'Summer Atumn 32 Dino Sun Wolf Pig Red Blue Yellow',
    ),
    Movie(
      id: 8,
      imageName: AppImages.moviePlaceHolder,
      title: 'Дюна',
      time: 'April 7, 2021',
      description: 'Summer Atumn 32 Dino Sun Wolf Pig Red Blue Yellow',
    ),
    Movie(
      id: 9,
      imageName: AppImages.moviePlaceHolder,
      title: 'Тихие зори',
      time: 'April 7, 2021',
      description: 'Summer Atumn 32 Dino Sun Wolf Pig Red Blue Yellow',
    ),
  ];

  final _searchController = TextEditingController();

  var _filteredMovies = <Movie>[];

  void _searchMovies() {
    final query = _searchController.text;
    if (query.isNotEmpty) {
      _filteredMovies = _movies.where((Movie movie) {
        return movie.title.toLowerCase().contains(query.toLowerCase());
      }).toList();
    } else {
      _filteredMovies = _movies;
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _filteredMovies = _movies;
    _searchController.addListener(_searchMovies);
  }

  void _onMovieTap(int index) {
    final id = _movies[index].id;
    Navigator.of(context).pushNamed(
      '/main_screen/movie_details',
      arguments: id,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView.builder(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          padding: const EdgeInsets.only(top: 70),
          itemCount: _filteredMovies.length,
          itemExtent: 163,
          itemBuilder: (BuildContext context, int index) {
            final movie = _filteredMovies[index];
            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 10,
              ),
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.black.withOpacity(0.2),
                      ),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    clipBehavior: Clip.hardEdge,
                    child: Row(
                      children: [
                        Image.asset(movie.imageName),
                        const SizedBox(width: 15),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 20),
                              Text(
                                movie.title,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                movie.time,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: const TextStyle(color: Colors.grey),
                              ),
                              const SizedBox(height: 20),
                              Text(
                                movie.description,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 10),
                      ],
                    ),
                  ),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () => _onMovieTap(index),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  )
                ],
              ),
            );
          },
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: TextField(
            controller: _searchController,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white.withAlpha(235),
              border: const OutlineInputBorder(),
              labelText: 'Поиск',
            ),
          ),
        ),
      ],
    );
  }
}
