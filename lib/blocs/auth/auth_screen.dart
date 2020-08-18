import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socservice_first_app/blocs/auth/auth_bloc.dart';
import 'package:socservice_first_app/screens/fade_animation.dart';
import 'package:socservice_first_app/screens/home_screen.dart';
import 'package:socservice_first_app/screens/my_flat_button.dart';
import 'package:socservice_first_app/screens/screen_loading.dart';
import 'package:socservice_first_app/screens/show_error.dart';

class AuthScreen extends StatefulWidget {
  static String route = "login_screen";

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Вход'),
      ),
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthError) showErrorDialog(context, state.message);
          if (state is AuthLogedIn) _listenLogedIn(context);
          //if (state is AuthNeedRegistration) _listenNeedRegist(context, state);
        },
        child: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            if (state is AuthLoading) return ScreenLoading();
            return _buildDefault();
          },
        ),
      ),
    );
  }

  void _listenLogedIn(BuildContext context) {
    print('listenLogedIn');
    Navigator.of(context).pushReplacementNamed(HomeScreen.route);
  }

  Widget _buildDefault() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(22.0),
        child: Column(
          children: <Widget>[
            SizedBox(height: 90.0),
            FadeAnimation(
              1.8,
              TextField(
                controller: _usernameController,
                decoration: InputDecoration(
                  labelText: "Логин",
                  labelStyle: TextStyle(color: Colors.black),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 20.0),
            FadeAnimation(
              1.8,
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Пароль",
                  labelStyle: TextStyle(color: Colors.black),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 20.0),
            FadeAnimation(
              2.4,
              MyFlatButton(
                title: 'Продолжить',
                onClick: () => _onContinue(context),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onContinue(BuildContext context) {
    String username = _usernameController.text;
    String password = _passwordController.text;
    context.bloc<AuthBloc>().add(Login(username: username, password: password));
    //Navigator.of(context).pushReplacementNamed(HomeScreen.route);
  }
}
