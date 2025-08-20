import 'dart:collection';
import 'dart:developer';

import 'package:flutter/material.dart';


import '../models/film.dart';
import '../services/film_service.dart';


class AppViewModel extends ChangeNotifier {
  final _films = <Film>[];


  AppViewModel() {
    fetchFilms().then(
          (value) {
        _films.addAll(value);
        notifyListeners();
      },
    ).catchError((error) {
      // Correction: utiliser catchError au lieu de onError
      // et convertir l'erreur en string avec toString()
      log('Erreur lors du chargement des films: ${error.toString()}');
    });
  }

  UnmodifiableListView<Film> get films => UnmodifiableListView(_films);

  //ajouter un nv film
  void addFilm(Film film){
      _films.add(film);
      notifyListeners();
  }

}