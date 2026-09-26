import 'package:app/core/ui/user_view.dart';
import 'package:app/core/ui/user_view_dio.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:   UserViewDio(),
    );
  }
}