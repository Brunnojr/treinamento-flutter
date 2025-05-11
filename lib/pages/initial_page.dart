import 'package:filme_flix_bruno.rodrigues/components/loading_movie_list.dart';
import 'package:filme_flix_bruno.rodrigues/components/movie_card.dart';
import 'package:filme_flix_bruno.rodrigues/components/movie_list_error.dart';
import 'package:filme_flix_bruno.rodrigues/models/movie.dart';
import 'package:filme_flix_bruno.rodrigues/repositories/movie_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class InitialPage extends StatefulWidget {
  const InitialPage({super.key});

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  late MovieRepository movieRepository;
  List<Movie> movies = [];
  @override
  void initState() {
    movieRepository = MovieRepository();
    getMovies();
    super.initState();
  }

  Future<void> getMovies() async {
    final moviesDb = await movieRepository.getMoviesDb();
    if (moviesDb.isNotEmpty) {
      setState(() {
        movies = moviesDb;
      });
    }

    final moviesApi = await movieRepository.getMovies();
    if (moviesApi.isNotEmpty) {
      setState(() {
        movies = moviesApi;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          "assets/images/movie_banner.png",
          fit: BoxFit.cover,
          height: 450,
          width: double.infinity,
        ),
        const SizedBox(height: 20),
        const Text(
          'Popular Movie',
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 180,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: movies.length,
            itemBuilder: (context, index) {
              if (movies.isEmpty) {
                return const LoadingMovieList();
              }
              return MovieCard(movie: movies[index]);
            },
          ),
        ),

        // FutureBuilder(
        //   future: MovieRepository().getMovies(),
        //   builder: (ctx, snapshot) {
        //     if (snapshot.connectionState == ConnectionState.waiting) {
        //       return const LoadingMovieList();
        //     }

        //     if (snapshot.hasError) {
        //       return MovieListError(
        //         onRetry: () {
        //           setState(() {}); // refaz o build para tentar novamente
        //         },
        //       );
        //     }

        //     final movies = snapshot.data ?? [];

        //     return SizedBox(
        //       height: 180,
        //       child: ListView.builder(
        //         scrollDirection: Axis.horizontal,
        //         itemCount: movies.length,
        //         itemBuilder: (context, index) {
        //           return MovieCard(movie: movies[index]);
        //         },
        //       ),
        //     );
        //   },
        // ),
      ],
    );
  }
}
