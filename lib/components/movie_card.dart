import 'package:filme_flix_bruno.rodrigues/models/movie.dart';
import 'package:flutter/material.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({required this.movie, super.key});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    final path = 'https://image.tmdb.org/t/p/original${movie.imagePath}';

    return Container(
      padding: EdgeInsets.only(right: 8),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: Image.network(
        path,
        errorBuilder:
            (context, error, stackTrace) => Container(color: Colors.grey),
        fit: BoxFit.cover,
        height: 180,
        width: 120,
      ),
    );
  }
}
