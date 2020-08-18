part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthLogedIn extends AuthState {
  final User user;
  AuthLogedIn({@required this.user});
}

class AuthLogedOut extends AuthState {}

class AuthError extends AuthState {
  final String message;
  AuthError({this.message});
}

class AuthDetailError extends AuthState {
  final String message;
  AuthDetailError({this.message});
}
