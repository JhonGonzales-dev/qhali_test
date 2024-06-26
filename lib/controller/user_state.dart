part of 'user_cubit.dart';

abstract class UserState extends Equatable {}

final class UserInitial extends UserState {
  @override
  List<Object?> get props => [];
}

final class UserLoading extends UserState {
  @override
  List<Object?> get props => [];
}

final class UserSuccess extends UserState {
  final List<User> users;

  UserSuccess(this.users);
  @override
  List<Object?> get props => [users];
}

final class UserUpdated extends UserState {
  final List<User> users;

  UserUpdated(this.users);
  @override
  List<Object?> get props => [users];
}

final class UserDeleted extends UserState {
  final List<User> users;

  UserDeleted(this.users);
  @override
  List<Object?> get props => [users];
}

class LoadedData extends UserState {
  final Map<String, dynamic> formValues;

  LoadedData(this.formValues);
  @override
  List<Object?> get props => [formValues];
}

final class UserAdd extends UserState {
  final List<User> users;

  UserAdd(this.users);
  @override
  List<Object?> get props => [users];
}

final class UserSelected extends UserState {
  final User user;

  UserSelected(this.user);
  @override
  List<Object?> get props => [user];
}

final class UserError extends UserState {
  @override
  List<Object?> get props => [];
}
