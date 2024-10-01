import 'package:api_practice/bloc/cubit/result_state.dart';
import 'package:api_practice/bloc/cubit/user_cubit.dart';
import 'package:api_practice/models/user.dart';
import 'package:api_practice/network/network_exceptions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Users> userList = [];
  Users user = Users();

  @override
  void initState() {
    super.initState();
    //  BlocProvider.of<UserCubit>(context).getAllUsers();
    //BlocProvider.of<UserCubit>(context).getUserById(7430401);
    BlocProvider.of<UserCubit>(context).createNewUser(
      Users(
        name: "Mohamed Osama Mohamed",
        email: 'mohamedosama1@gmail.com',
        gender: "male",
        status: "active",
      ),
    );
    //BlocProvider.of<UserCubit>(context).deleteUser(7430401);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: const Text('Home screen'),
      ),
      body: Column(children: [
        BlocBuilder<UserCubit, ResultState<Users>>(
          builder: (context, state) {
            return state.when(idle: () {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }, loading: () {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }, success: (Users data) {
              return Container(
                height: 50,
                color: const Color.fromARGB(255, 123, 123, 126),
                child: Center(
                  child: Text(
                    data.gender.toString(),
                  ),
                ),
              );
            }, error: (NetworkExceptions error) {
              return Container(
                height: 50,
                color: const Color.fromARGB(255, 68, 68, 163),
                child: Center(
                  child: Text(
                    error.toString(),
                  ),
                ),
              );
            });
          },
        ),

        // BlocBuilder<UserCubit, UserState>(
        //   builder: (context, state) {
        //     if (state is CreateUserSuccessState) {
        //       user = (state).newUser;
        //       return Container(
        //         height: 50,
        //         color: const Color.fromARGB(255, 123, 123, 126),
        //         child: Center(
        //           child: Text(
        //             user.name.toString(),
        //           ),
        //         ),
        //       );
        //     }
        //     if (state is CreateUserFailureState) {
        //       return const Center(
        //         child: Text('Something went wrong'),
        //       );
        //     }
        //     if (state is CreateUserLoadingState) {
        //       return const Center(
        //         child: CircularProgressIndicator(),
        //       );
        //     } else {
        //       return Container();
        //     }
        //   },
        // ),
        // // BlocBuilder<UserCubit, UserState>(
        //   builder: (context, state) {
        //     if (state is UserSuccessstate) {
        //       userList = (state).allUserList;
        //       return ListView.separated(
        //         physics: const BouncingScrollPhysics(),
        //         shrinkWrap: true,
        //         itemCount: userList.length,
        //         padding: const EdgeInsets.all(8),
        //         itemBuilder: ((context, index) {
        //           return Column(
        //             children: [
        //               Container(
        //                 height: 50,
        //                 color: const Color.fromARGB(255, 123, 123, 126),
        //                 child: Center(
        //                   child: Text(
        //                     userList[index].name.toString(),
        //                   ),
        //                 ),
        //               ),
        //             ],
        //           );
        //         }),
        //         separatorBuilder: (BuildContext context, int index) {
        //           return const Divider(
        //             color: Colors.white,
        //             height: 5,
        //           );
        //         },
        //       );
        //     }
        //     if (state is UserFailurestate) {
        //       return const Center(
        //         child: Text('Something went wrong'),
        //       );
        //     }
        //     if (state is UserLoadingstate) {
        //       return const Center(
        //         child: CircularProgressIndicator(),
        //       );
        //     } else {
        //       return Container();
        //     }
        //   },
        // ),

        // BlocBuilder<UserCubit, UserState>(
        //   builder: (context, state) {
        //     if (state is GetUserByIdSuccessState) {
        //       user = (state).userDetails;
        //       return Container(
        //         height: 50,
        //         color: const Color.fromARGB(255, 123, 123, 126),
        //         child: Center(
        //           child: Text(
        //             user.gender.toString(),
        //           ),
        //         ),
        //       );
        //     }
        //     if (state is UserFailurestate) {
        //       return const Center(
        //         child: Text('Something went wrong'),
        //       );
        //     }
        //     if (state is UserLoadingstate) {
        //       return const Center(
        //         child: CircularProgressIndicator(),
        //       );
        //     } else {
        //       return Container();
        //     }
        //   },
        // ),
      ]),
    );
  }
}
