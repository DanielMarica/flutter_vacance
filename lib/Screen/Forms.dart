import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../ViewModel/AppViewModel.dart';
import '../models/film.dart';


class Forms extends StatefulWidget {
  const Forms({super.key});

  @override
  State<Forms> createState() => _FormularScreenState();
}

class _FormularScreenState extends State<Forms> {

  final _formKey = GlobalKey<FormState>();
  // Controllers for the form fields
  // final String id;
  //   final String title;
  //   final String image;
  //   final String description;
  //   final String releaseDate;
  //   final String director;
  //   final String runningTime;
  //   final String rtScore;

  final _titleController = TextEditingController();
  final _contentController = TextEditingController();
  final _imageController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _releaseDateController = TextEditingController();
  final _directorController = TextEditingController();
  final _runningTimeController = TextEditingController();
  final _rtScoreController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Nouveau Film")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(labelText: "Titre"),
                validator: (value) =>
                value == null || value.isEmpty ? "Titre requis" : null,
              ),
              TextFormField(
                controller: _imageController,
                decoration: const InputDecoration(labelText: "Image URL"),
                validator: (value) =>
                value == null || value.isEmpty ? "Image URL requise" : null,
              ),
              TextFormField(
                controller: _descriptionController,
                decoration: const InputDecoration(labelText: "Description"),
                maxLines: 3,
                validator: (value) =>
                value == null || value.isEmpty ? "Description requise" : null,
              ),
              TextFormField(
                controller: _releaseDateController,
                decoration: const InputDecoration(labelText: "Date de sortie"),
                validator: (value) =>
                value == null || value.isEmpty ? "Date de sortie requise" : null,
              ),
              TextFormField(
                controller: _directorController,
                decoration: const InputDecoration(labelText: "Réalisateur"),
                validator: (value) =>
                value == null || value.isEmpty ? "Réalisateur requis" : null,
              ),
              TextFormField(
                controller: _runningTimeController,
                decoration: const InputDecoration(labelText: "Durée"),
                validator: (value) =>
                value == null || value.isEmpty ? "Durée requise" : null,
              ),
              TextFormField(
                controller: _rtScoreController,
                decoration: const InputDecoration(labelText: "RT Score"),
                validator: (value) =>
                value == null || value.isEmpty ? "RT Score requis" : null,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final newFilm = Film(
                      id: DateTime.now().toString(), // Generate a unique ID
                      title: _titleController.text,
                      image: _imageController.text,
                      description: _descriptionController.text,
                      releaseDate: _releaseDateController.text,
                      director: _directorController.text,
                      runningTime: _runningTimeController.text,
                      rtScore: _rtScoreController.text,
                    );
                    context.read<AppViewModel>().addFilm(newFilm); // ✅
                    Navigator.pop(context);
                  }
                },
                child: const Text("Ajouter"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
