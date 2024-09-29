part of 'user_cubit.dart';

@immutable
sealed class UserState {}

final class UserInitial extends UserState {}

final class UserLoadingstate extends UserState {}

final class UserSuccessstate extends UserState {
  final List<Users> allUserList;

  UserSuccessstate(this.allUserList);
}

final class UserFailurestate extends UserState {
  final String error;
  UserFailurestate(this.error);
}

final class GetUserByIdLoadingState extends UserState {}

final class GetUserByIdSuccessState extends UserState {
  final Users userDetails;
  GetUserByIdSuccessState(this.userDetails);
}

final class GetUserByIdFailureState extends UserState {
  final String error;
  GetUserByIdFailureState(this.error);
}

final class CreateUserLoadingState extends UserState {}

final class CreateUserSuccessState extends UserState {
  final Users newUser;
  CreateUserSuccessState(this.newUser);
}

final class CreateUserFailureState extends UserState {
  final String error;
  CreateUserFailureState(this.error);
}
