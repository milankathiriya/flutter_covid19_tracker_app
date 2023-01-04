import 'package:covid_19_tracker_app/views/screens/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(useMaterial3: true).copyWith(
        appBarTheme: AppBarTheme(backgroundColor: Colors.indigoAccent),
      ),
      routes: {
        '/': (context) => const HomePage(),
      },
    ),
  );
}
