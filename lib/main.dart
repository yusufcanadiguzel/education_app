import 'package:education_app/app.dart';
import 'package:education_app/custom_bloc_observer.dart';
import 'package:education_app/repositories/concrete/firebase/firebase_user_repository.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  Bloc.observer = CustomBlocObserver();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(
    EducationApp(
      userRepository: FirebaseUserRepository(),
    ),
  );
}
