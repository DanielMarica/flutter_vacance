//classe film avec comme attributs id, title, image, description, release_date, director, running_time, rt_score.

class Film {
  final String id;
  final String title;
  final String image;
  final String description;
  final String releaseDate;
  final String director;
  final String runningTime;
  final String rtScore;

  const Film({
    required this.id,
    required this.title,
    required this.image,
    required this.description,
    required this.releaseDate,
    required this.director,
    required this.runningTime,
    required this.rtScore,
  });

  toJson() {
    return {
      'id': id,
      'title': title,
      'image': image,
      'description': description,
      'release_date': releaseDate,
      'director': director,
      'running_time': runningTime,
      'rt_score': rtScore,
    };
  }

  static Film fromJson(item) {
    return Film(
      id: item['id'] ?? 'id inconnu',
      title: item['title'] ?? 'titre inconnu',
      image: item['image'] ?? 'image inconnue',
      description: item['description'] ?? 'description inconnue',
      releaseDate: item['release_date'] ?? 'date de sortie inconnue',
      director: item['director'] ?? 'réalisateur inconnu',
      runningTime: item['running_time'] ?? 'durée inconnue',
      rtScore: item['rt_score'] ?? 'score inconnu',
    );
  }
}