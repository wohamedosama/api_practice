import 'package:api_practice/models/user.dart';
import 'package:api_practice/repo/my_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final MyRepo myRepo;
  UserCubit(this.myRepo) : super(UserInitial());
  void getAllUsers() {
    emit(UserLoadingstate());
    myRepo.getAllUsers().then((users) {
      emit(UserSuccessstate(users));
    }).catchError((error) {
      emit(UserFailurestate(error.toString()));
    });
  }
}
