part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class CheckUser extends AuthEvent {}

class Login extends AuthEvent {
  final String username;
  final String password;

  Login({@required this.username, @required this.password});
}

class Logout extends AuthEvent {}
