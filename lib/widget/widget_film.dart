import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/film.dart';

class WidgetFilm extends StatelessWidget {
  final Film film;
  const WidgetFilm({super.key, required this.film});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Image.network(
            film.image,
            width: 100,
            height: 150,
            fit: BoxFit.cover,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  film.releaseDate,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  film.title,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text('Rating: ${film.rtScore}'),
                Text('Duration: ${film.runningTime}'),
                Text(
                  film.director,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(film.description),
                const SizedBox(height: 8),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
