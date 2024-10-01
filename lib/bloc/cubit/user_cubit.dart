import 'package:api_practice/bloc/cubit/result_state.dart';
import 'package:api_practice/models/user.dart';
import 'package:api_practice/network/network_exceptions.dart';
import 'package:api_practice/repo/my_repo.dart';
import 'package:bloc/bloc.dart';

class UserCubit extends Cubit<ResultState<Users>> {
  final MyRepo myRepo;
  UserCubit(this.myRepo) : super(const Idle());

  void createNewUser(Users user) async {
    var data = await myRepo.createNewUser(user);
    data.when(success: (Users userData) {
      emit(ResultState.success(userData));
    }, failure: (NetworkExceptions networkExceptions) {
      emit(ResultState.error(networkExceptions));
    });
  }

  void getAllUsers() async {
    var data = await myRepo.getAllUsers();
    data.when(
        success: (List<Users> userData) {
          emit(ResultState.success(userData as Users));
        },
        failure: (NetworkExceptions networkExceptions) =>
            emit(ResultState.error(networkExceptions)));
  }

  void getUserById(int id) async {
    var data = await myRepo.getUserById(id);
    data.when(
        success: (Users userData) => emit(ResultState.success(userData)),
        failure: (NetworkExceptions networkExceptions) =>
            emit(ResultState.error(networkExceptions)));
  }

  void deleteUser(int id) async {
    var data = await myRepo.deleteUser(id);
    data.when(
        success: (Users userData) => emit(ResultState.success(userData)),
        failure: (NetworkExceptions networkExceptions) =>
            emit(ResultState.error(networkExceptions)));
  }
}
