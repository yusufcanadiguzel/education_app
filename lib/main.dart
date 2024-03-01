import 'package:education_app/blocs/catalog_bloc/catalog_bloc.dart';
import 'package:education_app/blocs/get_user_by_id_bloc/get_user_by_id_bloc.dart';
import 'package:education_app/blocs/user_bloc/user_bloc.dart';
import 'package:education_app/screens/catalog_screen.dart';
import 'package:education_app/screens/home_screen.dart';
import 'package:education_app/app.dart';
import 'package:education_app/custom_bloc_observer.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'firebase_options.dart';
import 'repositories/concrete/firebase/firebase_user_repository.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseAppCheck.instance.activate(
    androidProvider: AndroidProvider.playIntegrity,
    appleProvider: AppleProvider.appAttest,
    webProvider: ReCaptchaV3Provider('recaptcha-v3-site-key'),
  );

  Bloc.observer = CustomBlocObserver();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(
    EducationApp(
      userRepository: FirebaseUserRepository(),
    ),
  );
}
