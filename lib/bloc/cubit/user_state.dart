part of 'user_cubit.dart';

@immutable
sealed class UserState {}

final class UserInitial extends UserState {}

final class UserLoadingstate extends UserState {}

final class UserSuccessstate extends UserState {
  final UsersResponse allUserList;

  UserSuccessstate(this.allUserList);
}

final class UserFailurestate extends UserState {
  final String error;
  UserFailurestate(this.error);
}
