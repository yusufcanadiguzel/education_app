import 'package:education_app/blocs/auth_bloc/auth_bloc.dart';
import 'package:education_app/blocs/auth_bloc/auth_state.dart';
import 'package:education_app/blocs/get_users_bloc/get_users_bloc.dart';
import 'package:education_app/blocs/sign_in_bloc/sign_in_bloc.dart';
import 'package:education_app/constants/strings/magic_strings.dart';
import 'package:education_app/screens/authentication/welcome_screen.dart';
import 'package:education_app/screens/home_screen.dart';
import 'package:education_app/theme/theme_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EducationAppView extends StatelessWidget {
  const EducationAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      title: MagicStrings.appTitle,
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (state.status == AuthenticationStatus.authenticated) {
            return MultiBlocProvider(
              providers: [
                BlocProvider<SignInBloc>(
                  create: (context) => SignInBloc(
                      userRepository:
                          context.read<AuthenticationBloc>().userRepository),
                ),
                BlocProvider<GetUsersBloc>(
                  create: (context) => GetUsersBloc(
                    repository:
                        context.read<AuthenticationBloc>().userRepository,
                  ),
                ),
              ],
              child: const HomeScreen(),
            );
          } else {
            return const WelcomeScreen();
          }
        },
      ),
    );
  }
}
