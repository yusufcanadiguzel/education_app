import 'package:education_app/blocs/auth_bloc/auth_bloc.dart';
import 'package:education_app/blocs/auth_bloc/auth_state.dart';
import 'package:education_app/screens/home_screen.dart';
import 'package:education_app/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EducationAppView extends StatelessWidget {
  const EducationAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EducationApp',
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (state.status == AuthenticationStatus.authenticated) {
            return MultiBlocProvider(
              providers: [],
              child: const HomeScreen(),
            );
          } else {
            return const LoginScreen();
          }
        },
      ),
    );
  }
}
