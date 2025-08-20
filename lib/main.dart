
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'Screen/Forms.dart';
import 'Screen/HomeScreen.dart';
import 'ViewModel/AppViewModel.dart';


void main() {
  runApp(ChangeNotifierProvider<AppViewModel>(
    create: (context) => AppViewModel(),
    child: const MyApp(),
  ));
}

final GoRouter _router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
        path: '/',
        builder: (context, state) => const HomeScreen(),
        routes: [
          GoRoute(
            path: 'film',
            builder: (context, state) => const Forms(),
          )
        ]
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Examen blanc',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: _router,
    );
  }
}
