import 'dart:convert';

class Movie {
  final int id;
  final String? title;
  final String? imagePath;

  Movie({required this.id, this.title, this.imagePath});

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'],
      title: json['title'],
      imagePath: json['poster_path'],
    );
  }

  String get toJson =>
      jsonEncode({'id': id, 'title': title, 'poster_path': imagePath});
}
