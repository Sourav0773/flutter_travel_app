import 'package:flutter/material.dart';
import 'package:basic_app/pages/about_page.dart';
import 'package:basic_app/pages/contact_page.dart';
import 'package:basic_app/pages/home_page.dart';
import 'package:basic_app/pages/destination_page.dart';

void main() {
  runApp(const BlogApp());
}

class BlogApp extends StatelessWidget {
  const BlogApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blog App',
      debugShowCheckedModeBanner: false,
      initialRoute: '/', 
      routes: {
        '/': (context) => HomePage(),
        '/about': (context) => AboutPage(),
        '/contact': (context) => ContactPage(),
        '/destination': (context) => DestinationPage(), 
      },
      onUnknownRoute: (settings) => MaterialPageRoute(
        builder: (context) => HomePage(),
      ),
    );
  }
}
