import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:studio_giblih/ViewModel/AppViewModel.dart';

import '../widget/widget_film.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppViewModel>(builder : (context,viewModel,_)=>Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body:  Center(
    child: viewModel.films.isNotEmpty
    ? ListView.builder(
      itemCount: viewModel.films.length,
      itemBuilder: (context, index) => WidgetFilm(film: viewModel.films[index]),
    )
    : const Center(child: Text("No films available.")),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Action to add a new film
          context.go('/film');
        },
        child: const Icon(Icons.add),
      ),
    )
    );
  }
}
