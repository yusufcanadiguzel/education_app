import 'package:education_app/app_view.dart';
import 'package:education_app/blocs/auth_bloc/auth_bloc.dart';
import 'package:education_app/repositories/abstract/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EducationApp extends StatelessWidget {
  final UserRepository userRepository;
  const EducationApp({required this.userRepository, super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AuthenticationBloc>(
          create: (context) => AuthenticationBloc(
            repository: userRepository,
          ),
        )
      ],
      child: const EducationAppView(),
    );
  }
}
