import 'package:api_practice/bloc/cubit/user_cubit.dart';
import 'package:api_practice/injection.dart';
import 'package:api_practice/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  gitInject();

  runApp(const APIPractice());
}

class APIPractice extends StatelessWidget {
  const APIPractice({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => getIt<UserCubit>(),
        child: const HomeScreen(),
      ),
    );
  }
}
