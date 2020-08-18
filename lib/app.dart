import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'app_config.dart';
import 'blocs/auth/auth_bloc.dart';
import 'blocs/auth/auth_screen.dart';
import 'data/repositories/repository.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // clear();
    return RepositoryProvider(
      create: (context) => Repository(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AuthBloc(context.repository<Repository>()),
          ),
        ],
        child: MaterialApp(
          theme: getTheme(),
          home: AuthScreen(),
          routes: getRoutes(),
        ),
      ),
    );
  }
}
