import 'package:api_practice/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const APIPractice());
}

class APIPractice extends StatelessWidget {
  const APIPractice({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
