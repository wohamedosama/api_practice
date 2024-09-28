import 'package:api_practice/bloc/cubit/user_cubit.dart';
import 'package:api_practice/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  UsersResponse usersResponse = UsersResponse();
  @override
  void initState() {
    BlocProvider.of<UserCubit>(context).getAllUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Home screen',
        ),
      ),
      body: Column(children: [
        BlocBuilder<UserCubit, UserState>(
          builder: (context, state) {
            if (state is UserSuccessstate) {
              usersResponse = state.allUserList;
              return ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: usersResponse.data!.length,
                  padding: const EdgeInsets.all(8),
                  itemBuilder: ((context, index) {
                    Container(
                      height: 50,
                      color: Colors.redAccent,
                      child: Center(
                        child: Text(
                          usersResponse.data![index].email.toString(),
                        ),
                      ),
                    );
                    return Container();
                  }));
            } else if (state is UserLoadingstate) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is UserFailurestate) {
              return const Center(
                child: Text('Failed to load users'),
              );
            } else {
              return Container();
            }
          },
        ),
      ]),
    );
  }
}
