import 'dart:async';
import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:socservice_first_app/data/model/user.dart';
import 'package:socservice_first_app/data/repositories/repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  Repository _repository;
  AuthBloc(this._repository);

  @override
  AuthState get initialState => AuthInitial();

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is CheckUser) yield* _mapCheckUserToState();
    if (event is Login) yield* _mapLoginToState(event);
    if (event is Logout) yield* _mapLogoutToState();
  }

  Stream<AuthState> _mapCheckUserToState() async* {
    try {
      User user = _repository.user;
      if (user == null)
        yield AuthLogedOut();
      else
        yield AuthLogedIn(user: user);
    } catch (e) {
      yield AuthError(message: e.toString());
    }
  }

  Stream<AuthState> _mapLoginToState(Login event) async* {
    try {
      yield AuthLoading();
      await _repository.initUser(event.username, event.password);
      yield AuthLogedIn(user: _repository.user);
    } catch (e) {
      String message;
      if (e is SocketException)
        message = "Проверьте интернет соединение и попробуйте снова";

      /*if (e.message == 401)
        yield AuthError(message: 'Не правильный логин или пароль');
      else*/
      message = e.toString();
      yield AuthError(message: message);
    }
  }

  Stream<AuthState> _mapLogoutToState() async* {
    _repository.user = null;
    //await LocalUserService.deleteUser();
    yield AuthLogedOut();
  }
}
