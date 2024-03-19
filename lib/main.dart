import 'package:flutter/material.dart';
import 'package:flutter_provider/favourites/home_screen.dart';
import 'package:flutter_provider/provider/count_provider.dart';
import 'package:flutter_provider/provider/example_two_provider.dart';
import 'package:flutter_provider/provider/favourite_provider.dart';
import 'package:flutter_provider/screens/example_one.dart';
import 'package:flutter_provider/screens/example_two.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CountProvider()),
        ChangeNotifierProvider(create: (_) => ExampleTwoProvider()),
        ChangeNotifierProvider(create: (_) => FavouriteProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Provider Package',
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}
