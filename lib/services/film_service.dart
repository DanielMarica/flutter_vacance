import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:studio_giblih/models/film.dart';

const _apiUrl = 'https://sebstreb.github.io/flutter-fiche-5/ghibli-films';

Future<List<Film>> fetchFilms() async {
  var response = await get(Uri.parse(_apiUrl));

  if (response.statusCode != 200) {
    throw Exception("Error ${response.statusCode} fetching films");
  }
  //  final int id;
  //   final String title;
  //   final String image;
  //   final String description;
  //   final String releaseDate;
  //   final String director;
  //   final String runningTime;
  //   final String rtScore;

  return compute((input) {
    final jsonList = jsonDecode(input);
    return jsonList
        .map<Film>((jsonObj) => Film(
          id: jsonObj['id'] ?? 0,
          title: jsonObj['title'] ?? 'titre inconnu',
          image: jsonObj['image'] ?? 'image inconnue',
          description: jsonObj['description'] ?? 'description inconnue',
          releaseDate: jsonObj['release_date'] ?? 'date de sortie inconnue',
          director: jsonObj['director'] ?? 'réalisateur inconnu',
          runningTime: jsonObj['running_time'] ?? 'durée inconnue',
          rtScore: jsonObj['rt_score'] ?? 'score inconnu',
        )).toList();
  }, response.body);

}