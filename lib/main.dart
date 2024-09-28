import 'package:flutter/material.dart';

void main() async {
  //gitInject();

  runApp(const APIPractice());
}

class APIPractice extends StatelessWidget {
  const APIPractice({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
    );
  }
}
