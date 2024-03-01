import 'package:education_app/blocs/auth_bloc/auth_bloc.dart';
import 'package:education_app/blocs/user_bloc/user_bloc.dart';
import 'package:education_app/screens/home_screen.dart';
import 'package:education_app/screens/register_screen.dart';
import 'package:education_app/screens/welcome_screen.dart';
import 'package:education_app/theme/theme_constants.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'firebase_options.dart';
import 'screens/login_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => UserBloc(),
        ),
        BlocProvider(
          create: (context) => AuthBloc(),
        ),
      ],
      child: MaterialApp(
        home: const HomeScreen(),
        theme: lightTheme,
        darkTheme: darkTheme,
        debugShowCheckedModeBanner: false,
      ),
    ),
  );
}
