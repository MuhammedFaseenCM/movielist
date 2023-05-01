import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:movielist/controller/movieadd_provider.dart';
import 'package:movielist/controller/movielist_provider.dart';
import 'package:movielist/model/movie_model.dart';
import 'package:movielist/view/home_screen.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(MovieModelAdapter().typeId)) {
    Hive.registerAdapter(MovieModelAdapter());
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => MovieListProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => MovieAddProvider(),
        )
      ],
      child: MaterialApp(
        title: 'Movie List',
        theme: ThemeData(
          primarySwatch: Colors.pink,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
