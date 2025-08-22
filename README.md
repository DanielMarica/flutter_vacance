# 🍽️ Menu App – Flutter + Provider + SQLite + File Editor

![Flutter](https://img.shields.io/badge/Framework-Flutter-blue?style=flat-square)
![Provider](https://img.shields.io/badge/State_Management-Provider-green?style=flat-square)
![SQLite](https://img.shields.io/badge/Database-SQLite-orange?style=flat-square)
![Dart](https://img.shields.io/badge/Language-Dart-lightblue?style=flat-square)
![File Editor](https://img.shields.io/badge/Feature-File_Editor-purple?style=flat-square)

---

## 🚀 Installation et Configuration

### 1. Ajout des dépendances

Exécute les commandes suivantes dans l'ordre pour installer toutes les dépendances nécessaires :

```bash
flutter pub add go_router
flutter pub add provider
flutter pub add url_launcher
flutter pub add http
flutter pub add shared_preferences
flutter pub add sqflite
flutter pub add path
flutter pub add sqflite_common_ffi
flutter pub add sqflite_common_ffi_web
flutter pub add intl
flutter pub add file_picker
flutter pub get
dart run sqflite_common_ffi_web:setup
```

### 2. Dépendances dans `pubspec.yaml`

Après l'exécution des commandes, ton fichier `pubspec.yaml` devrait contenir :

```yaml
dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.6
  go_router: ^13.2.1
  provider: ^6.1.2
  url_launcher: ^6.3.1
  http: ^1.2.1
  shared_preferences: ^2.5.3
  sqflite: ^2.4.2
  path: ^1.9.1
  sqflite_common_ffi: ^2.3.3
  sqflite_common_ffi_web: ^1.0.0
  intl: ^0.20.2
  file_picker: ^6.1.1

dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^5.0.0
```
---
### 3. Fichier `main.dart`
```dart
import 'package:examen_blanc/view_models/app_view_model.dart';
import 'package:examen_blanc/views/screens/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'views/screens/home_screen.dart';

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
          path: 'cart',
          builder: (context, state) => const CartScreen(),
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

```
---
## 📱 Exemple de Card -> card Image à droite en deux colones + explication 
```dart
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
```
## 📱 Exemple de Card -> card + arrondi de bas en haut 
```
import 'package:flutter/material.dart';
import '../../models/stop.dart';

class StopWidget extends StatelessWidget {
  final Stop stop;

  const StopWidget({super.key, required this.stop});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Card(
        elevation: 4,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  stop.mural.imagePath,
                  width: 150,
                  height: 150,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) =>
                      Icon(Icons.image_not_supported, size: 60),
                ),
              ),
              SizedBox(height: 12),
              Text(
                stop.mural.name,
                style: Theme.of(context).textTheme.headlineSmall,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 8),
              Text(
                stop.mural.address,
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 8),
              IconButton(onPressed: (){}, icon: Icon(Icons.add))
            ],
          ),
        ),
      ),
    );
  }
}
```

## 📱 Exemple de Card -> card + bouton + image 
```dart
return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 16),
        child: Column(
          children: [
            ListTile(
              leading: IconButton(
                onPressed: () {
                  Provider.of<AppViewModel>(
                    context,
                    listen: false,
                  ).addDishToCart(dish);
                },
                icon: Icon(Icons.add_shopping_cart),
              ),

              title: Text(dish.name),
              subtitle: Text('${dish.price}'),
              trailing:
              Image.network(
                  dish.imagePath,
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border.all(color: Colors.grey[300]!),
                      ),
                      child: const Icon(
                        Icons.image,
                        size: 40,
                        color: Colors.grey,
                      ),
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
```
### 📌 Configuration du `AppViewModel` -> normal sans appel asynchrone
```dart
//app view Model

import 'package:flutter/material.dart';
import 'package:formulaire/models/note.dart';
import 'package:formulaire/models/noteService.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:formulaire/ViewModel/AppViewModel.dart';
import 'package:formulaire/screens/HomeScreen.dart';


class AppViewModel with ChangeNotifier {
  final NoteService _noteService = NoteService();
  final List<Note> _favorites = [];
  final List<Note> _notes = [
    Note(title: 'Note 1', content: 'Content of note 1'),
    Note(title: 'Note 2', content: 'Content of note 2'),
    Note(title: 'Note 3', content: 'Content of note 3'),
    Note(title: 'Note 4', content: 'Content of note 4'),
    Note(title: 'Note 5', content: 'Content of note 5'),
  ];
  //create a list favorites
  List<Note> get favorites => List.unmodifiable(_favorites);

  List<Note> get notes => List.unmodifiable(_notes);

  void addNote(Note note) {
    _notes.add(note);
    notifyListeners();
  }

  void removeNote(Note note) {
    _notes.remove(note);
    notifyListeners();
  }

  Future<void> saveNotes() async {
    try {
      await _noteService.saveNotes(_notes);
      notifyListeners();
    } catch (e) {
      // Gérer l'erreur si nécessaire
      print('Erreur lors de la sauvegarde: $e');
    }
  }

  // Méthode corrigée pour charger
  Future<void> loadNotes() async {
    try {
      final loadedNotes = await _noteService.loadNotes();
      _notes.clear();
      _notes.addAll(loadedNotes);
      notifyListeners();
    } catch (e) {
      // Gérer l'erreur si nécessaire
      print('Erreur lors du chargement: $e');
    }
  }

  //add to favorite
  void addToFavorites(Note note) {
    if (!_favorites.contains(note)) {
      _favorites.add(note);
      notifyListeners();
    }
  }
  //remove from favorite
  void removeFromFavorites(Note note) {
    if (_favorites.contains(note)) {
      _favorites.remove(note);
      notifyListeners();
    }
  }


}



```
### 📌 Configuration du `AppViewModel` -> normal avec appel asynchrone

```dart
import 'dart:collection';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_project/services/mural_service.dart';

import '../models/mural.dart';
import '../models/stop.dart';
import '../services/itinerary_service.dart';
 // Import du service de sauvegarde

class AppViewModel extends ChangeNotifier {
  final List<Mural> _murals = [];
  late final List<Stop> _stops = [];

  AppViewModel() {
    _initMurals();
  }

  Future<void> _initMurals() async {
    try {
      final value = await fetchMurals();
      _murals.addAll(value);
      // Charge les stops après avoir chargé les murales
      await _loadStops();
      notifyListeners();
    } catch (error) {
      log('Erreur lors du chargement des fresques : $error');
    }
  }

  // Liste en lecture seule des fresques
  UnmodifiableListView<Mural> get murals => UnmodifiableListView(_murals);

  // Liste en lecture seule des arrêts
  UnmodifiableListView<Stop> get stops => UnmodifiableListView(_stops);

  // Nombre d'arrêts
  int get stopCount => _stops.length;

  // Nombre de dessinateurs différents
  int get uniqueCartoonistsCount {
    final cartoonists = _stops.map((stop) => stop.mural.cartoonist).toSet();
    return cartoonists.length;
  }

  void addStop(Mural mural) {
    if (_stops.any((stop) => stop.mural == mural)) return; // ignore si déjà ajouté
    _stops.add(Stop(mural: mural));
    _saveStops(); // Sauvegarde automatiquement
    notifyListeners();
  }

  // Supprimer un arrêt
  void removeStop(Stop stop) {
    _stops.remove(stop);
    _saveStops(); // Sauvegarde automatiquement
    notifyListeners();
  }

  void moveStopUp(Stop stop) {
    final index = _stops.indexOf(stop);
    if (index > 0) {
      // Échanger avec l'élément précédent
      final temp = _stops[index - 1];
      _stops[index - 1] = _stops[index];
      _stops[index] = temp;
      _saveStops(); // Sauvegarde automatiquement
      notifyListeners();
    }
  }

  void moveStopDown(Stop stop) {
    final index = _stops.indexOf(stop);
    if (index >= 0 && index < _stops.length - 1) {
      // Échanger avec l'élément suivant
      final temp = _stops[index + 1];
      _stops[index + 1] = _stops[index];
      _stops[index] = temp;
      _saveStops(); // Sauvegarde automatiquement
      notifyListeners();
    }
  }

  /// Charge les stops depuis le stockage
  Future<void> _loadStops() async {
    try {
      final loadedStops = await StopStorage.loadStops(_murals);
      _stops.clear();
      _stops.addAll(loadedStops);
      notifyListeners();
    } catch (e) {
      log('Erreur lors du chargement des stops: $e');
    }
  }

  /// Sauvegarde les stops actuels
  Future<void> _saveStops() async {
    try {
      await StopStorage.saveStops(_stops);
    } catch (e) {
      log('Erreur lors de la sauvegarde des stops: $e');
    }
  }

  /// Sauvegarde manuelle des stops (pour le bouton save)
  Future<void> saveStops() async {
    await _saveStops();
  }

  /// Efface tous les stops
  Future<void> clearAllStops() async {
    _stops.clear();
    await StopStorage.clearStops();
    notifyListeners();
  }

  /// Recharge les stops manuellement
  Future<void> reloadStops() async {
    await _loadStops();
  }
}
```

### 📌 Ajout d'un plat (`Dish`) au ViewModel

Utilise `Provider.of<AppViewModel>(context, listen: false)` pour appeler une méthode sans reconstruire le widget :

```dart
Provider.of<AppViewModel>(
  context,
  listen: false,
).addDish(newDish);
```

- `newDish` est une instance de ton modèle `Dish`
- Cette méthode met à jour les données et appelle `notifyListeners()` dans ton `ViewModel`

### 🖼️ Affichage dynamique de la liste avec `Consumer`

Le widget `Consumer` permet de reconstruire l'interface automatiquement lorsque la liste change :

```dart
body: Consumer<AppViewModel>(
  builder: (context, viewModel, child) {
    if (viewModel.dish.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }
    return MenuWidget(menu: viewModel.dish);
  },
),
```

- Si la liste est vide, un `loader` est affiché
- Sinon, un widget `MenuWidget` personnalisé affiche les plats

---

## 📝 Éditeur de Fichiers Intégré

### 🌟 Nouvelles Fonctionnalités

L'application inclut maintenant un **éditeur de fichiers complet** avec les fonctionnalités suivantes :

- ✅ **Création de nouveaux fichiers texte**
- ✅ **Ouverture de fichiers existants** (txt, md, json, csv)
- ✅ **Sauvegarde avec dialogue natif** (ou téléchargement sur web)
- ✅ **Interface adaptée par plateforme** (web vs mobile/desktop)
- ✅ **Gestion d'erreurs complète**
- ✅ **Support UTF-8** pour l'encodage des caractères

### 📌 Navigation vers l'Éditeur

```dart
// Depuis EditScreen - Créer un nouveau fichier
context.go('/open-creation');

// Depuis EditScreen - Ouvrir un fichier existant
context.go('/open-existing', extra: platformFile);
```

### 📌 Configuration des Routes pour l'Éditeur

```dart
final GoRouter _router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
      routes: [
        // ... autres routes
        
        // Route pour créer un nouveau fichier
        GoRoute(
          path: 'open-creation',
          builder: (context, state) {
            final PlatformFile? file = state.extra as PlatformFile?;
            return FileCreationScreen(file: file);
          },
        ),
        
        // Route pour ouvrir un fichier existant
        GoRoute(
          path: 'open-existing',
          builder: (context, state) {
            final PlatformFile? file = state.extra as PlatformFile?;
            return FileCreationScreen(file: file);
          },
        ),
      ],
    ),
  ],
);
```

### 📌 Utilisation du Sélecteur de Fichiers

```dart
// Dans EditScreen - Sélection d'un fichier
Future<void> _openExistingFile(BuildContext context) async {
  try {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      withData: true, // Récupère le contenu du fichier
      type: FileType.custom,
      allowedExtensions: ['txt', 'md', 'json', 'csv'],
    );

    if (result != null && result.files.isNotEmpty) {
      PlatformFile file = result.files.first;
      if (context.mounted) {
        context.go('/open-existing', extra: file);
      }
    }
  } catch (e) {
    // Gestion d'erreur
  }
}
```

### 📌 Fonctionnalités de Sauvegarde

```dart
// Dans FileCreationScreen - Sauvegarde du fichier
Future<void> _saveFile() async {
  try {
    String fileName = _fileNameController.text.isNotEmpty 
        ? _fileNameController.text 
        : "Nouveau fichier.txt";
    
    String content = _contentController.text;
    Uint8List bytes = utf8.encode(content);
    
    String? result = await FilePicker.platform.saveFile(
      fileName: fileName,
      bytes: bytes,
    );
    
    if (result != null) {
      // Succès - afficher message de confirmation
    }
  } catch (e) {
    // Gestion d'erreur
  }
}
```

### 🎨 Interface Adaptée par Plateforme

**Sur le Web :**
- Champ de texte modifiable pour le nom de fichier
- Téléchargement automatique lors de la sauvegarde

**Sur Mobile/Desktop :**
- Affichage statique du nom de fichier
- Dialogue de sauvegarde natif avec choix d'emplacement

---

## 🗄️ Configuration SQLite

### Structure de base

La configuration SQLite est automatiquement gérée par les dépendances ajoutées. Le support web est activé grâce à `sqflite_common_ffi_web`.

### Exemple d'utilisation avec `DishService` (Support Web + Mobile)

Voici ton service complet avec gestion kIsWeb et API :

```dart
import 'dart:convert';

import 'package:examen_juin1/models/dish.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:sqflite_common_ffi_web/sqflite_ffi_web.dart';

class DishService {
  late Database _database;

  Future<Database> get database async {
    await initDatabase();
    return _database;
  }

  Future<void> initDatabase() async {
    // Open the database

    if (kIsWeb) {
      // Web-specific initialization
      databaseFactory = databaseFactoryFfiWeb;
    } else {
      // Mobile-specific initialization (optional, sqflite handles this by default)
      sqfliteFfiInit();
      databaseFactory = databaseFactoryFfi;
    }

    _database = await openDatabase(
      join(await getDatabasesPath(), 'dishes.db'),
      version: 1,
      onCreate: (db, version) async {
        // Create the Dish table
        await db.execute(
          'CREATE TABLE Dish(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, price REAL, category TEXT, imagePath TEXT)',
        );
      },
    );

    // Check if the table is empty; if so, fetch from API and populate
    final result = await _database.rawQuery(
      "SELECT COUNT(*) AS count FROM Dish",
    );
    if (result[0]["count"] == 0) {
      // Fetch dishes from API and insert them into the database
      final apiDishes = await fetchDishesFromApi();
      for (var dish in apiDishes) {
        await _database.insert('Dish', {
          'name': dish.name,
          'price': dish.price,
          'category': dish.category,
          'imagePath': dish.imagePath,
        });
      }
    }
  }

  // Fetch dishes from the API (same as your original fetchDishes)
  Future<List<Dish>> fetchDishesFromApi() async {
    const String apiUrl =
        "https://sebstreb.github.io/binv2110-examen-blanc-api/dishes";
    var response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode != 200) {
      throw Exception("Error ${response.statusCode} fetching dishes");
    }

    return compute((input) {
      final jsonList = jsonDecode(input);
      return jsonList
          .map<Dish>(
            (jsonObj) => Dish(
              name: jsonObj["name"],
              price: jsonObj["price"],
              category: jsonObj["category"],
              imagePath: jsonObj["imagePath"],
            ),
          )
          .toList();
    }, response.body);
  }

  // Fetch all dishes from the database
  Future<List<Dish>> getDishes() async {
    final maps = await _database.query('Dish');
    return List.generate(maps.length, (i) {
      return Dish(
        name: maps[i]['name'] as String,
        price: maps[i]['price'] as double,
        category: maps[i]['category'] as String,
        imagePath: maps[i]['imagePath'] as String,
      );
    });
  }

  // Add a new dish to the database
  Future<Dish> createDish(
    String name,
    double price,
    String category,
    String imagePath,
  ) async {
    final id = await _database.insert('Dish', {
      "name": name,
      "price": price,
      "category": category,
      "imagePath": imagePath,
    });
    return Dish(
      name: name,
      price: price,
      category: category,
      imagePath: imagePath,
    );
  }
}
```
## 📱 Utilisation avec Provider + data Base -> Verifier dans Projet Formulaire

### 📌 Configuration du `AppViewModel`

Voici un exemple complet d'utilisation avec ton `AppViewModel` :

```dart
class AppViewModel with ChangeNotifier {
  final _dishes = <Dish>[];
  final _cart = <CartItem>[];
  final DishService _dishService = DishService();

  AppViewModel({required DishService dishService}) {
    _loadDishes();
  }

  Future<void> _loadDishes() async {
    try {
      await _dishService.initDatabase();
      final dishes = await _dishService.getDishes();
      _dishes.clear();
      _dishes.addAll(dishes);
      notifyListeners();
    } catch (error) {
      log("Error loading dishes: $error");
    }
  }

  UnmodifiableListView<Dish> get dish => UnmodifiableListView(_dishes);
  
  Future<void> addDish(Dish dish) async {
    await _dishService.createDish(
      dish.name,
      dish.price,
      dish.category,
      dish.imagePath,
    );
    await _loadDishes();
  }
  
  // Gestion du panier
  Future<void> increaseDish(Dish dish) async {
    final item = _cart.firstWhere(
      (item) => item.dish == dish,
      orElse: () {
        final item = CartItem(dish: dish);
        _cart.add(item);
        return item;
      },
    );
    item.count++;
    notifyListeners();
  }
}
```

---

## 🛣️ Navigation avec GoRouter

### Configuration de base

```dart
import 'package:go_router/go_router.dart';
import 'package:file_picker/file_picker.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
      routes: [
        GoRoute(
          path: 'menu',
          builder: (context, state) => const MenuScreen(),
        ),
        GoRoute(
          path: 'edit',
          builder: (context, state) => const EditScreen(),
        ),
        GoRoute(
          path: 'open-creation',
          builder: (context, state) {
            final PlatformFile? file = state.extra as PlatformFile?;
            return FileCreationScreen(file: file);
          },
        ),
        GoRoute(
          path: 'open-existing',
          builder: (context, state) {
            final PlatformFile? file = state.extra as PlatformFile?;
            return FileCreationScreen(file: file);
          },
        ),
      ],
    ),
  ],
);
```

### Navigation

```dart
// Navigation basique
context.go('/menu');
context.go('/edit');

// Navigation avec données (pour l'éditeur)
context.go('/open-creation'); // Nouveau fichier
context.go('/open-existing', extra: platformFile); // Fichier existant

// Retour
context.pop();
```

---

## 📦 Structure du Projet

```
lib/
├── main.dart
├── models/
│   ├── dish.dart
│   └── cart_item.dart
├── viewmodels/
│   └── app_view_model.dart
├── views/
│   ├── screens/
│   │   ├── home_screen.dart
│   │   ├── menu_screen.dart
│   │   ├── cart_screen.dart
│   │   └── edit_screen.dart
│   └── widgets/
│       ├── menu_widget.dart
│       ├── file_creation.dart
│       └── form_screen.dart
├── services/
│   └── dish_service.dart
└── database/
    └── database_helper.dart
```

---

## ✅ Résumé des Actions

| Action | Code utilisé |
|--------|--------------|
| ➕ **Ajouter un plat** | `Provider.of<AppViewModel>(context, listen: false).addDish(newDish);` |
| 👀 **Afficher la liste** | `Consumer<AppViewModel>(...)` avec `viewModel.dish` dans le `builder` |
| 🗄️ **Base de données** | `sqflite` + `path` pour la persistance locale |
| 🛣️ **Navigation** | `go_router` pour la navigation déclarative |
| 📝 **Créer un fichier** | `context.go('/open-creation');` |
| 📂 **Ouvrir un fichier** | `FilePicker.platform.pickFiles(withData: true)` |
| 💾 **Sauvegarder un fichier** | `FilePicker.platform.saveFile(fileName: name, bytes: data)` |

### 📌 Configuration avec `SharedPreferences` pour le panier

Utilise `SharedPreferences` pour sauvegarder le panier :

```dart
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

// Sauvegarder le panier
Future<void> save(List<CartItem> cart) async {
  final prefs = await SharedPreferences.getInstance();
  final cartJson = cart.map((item) => {
    'dishId': item.dish.id,
    'count': item.count,
  }).toList();
  await prefs.setString('cart', jsonEncode(cartJson));
}

// Charger le panier
Future<List<CartItem>> load(List<Dish> dishes) async {
  final prefs = await SharedPreferences.getInstance();
  final cartString = prefs.getString('cart');
  if (cartString == null) return [];
  
  final cartJson = jsonDecode(cartString) as List;
  return cartJson.map((item) {
    final dish = dishes.firstWhere((d) => d.id == item['dishId']);
    return CartItem(dish: dish)..count = item['count'];
  }).toList();
}
```

---

## 🎯 Fonctionnalités Principales

### 🍽️ Gestion de Menu
- ✅ Affichage dynamique des plats depuis l'API
- ✅ Persistance locale avec SQLite
- ✅ Ajout de nouveaux plats
- ✅ Gestion du panier avec SharedPreferences

### 📝 Éditeur de Fichiers
- ✅ **Création** de nouveaux fichiers texte
- ✅ **Ouverture** de fichiers existants (txt, md, json, csv)
- ✅ **Édition** avec interface de texte dédiée
- ✅ **Sauvegarde** avec dialogue natif
- ✅ **Support multiplateforme** (Web, Mobile, Desktop)
- ✅ **Encodage UTF-8** pour tous les caractères

### 🌐 Support Multiplateforme
- ✅ **Web** : Interface adaptée avec téléchargement automatique
- ✅ **Mobile** : Dialogues natifs et stockage local
- ✅ **Desktop** : Interface complète avec système de fichiers

---

## 🚀 Démarrage Rapide

1. Clone le projet
2. Exécute les commandes d'installation ci-dessus
3. Lance l'application avec `flutter run`
4. Profite de ton app de menu avec gestion d'état, base de données **et éditeur de fichiers intégré** !

✨ **Gère tes états de façon fluide et propre avec Provider dans Flutter, et édite tes fichiers directement dans l'app !**
