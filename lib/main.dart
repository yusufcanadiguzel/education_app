import 'package:education_app/app.dart';
import 'package:education_app/constants/strings/magic_strings.dart';
import 'package:education_app/custom_bloc_observer.dart';
import 'package:education_app/services/firebase/cloud_messaging/fcm_methods.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
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
    webProvider: ReCaptchaV3Provider(MagicStrings.webProviderType),
  );

  Bloc.observer = CustomBlocObserver();

  // initFCM fonksiyonunu çağırarak Firebase Messaging'i başlat
  FCMMethods.initFCM();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(
    EducationApp(
      userRepository: FirebaseUserRepository(),
    ),
  );
}

// Arka planda gelen bildirimleri işlemek için bir fonksiyon
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // Firebase'inizi başlatın
  await Firebase.initializeApp();
  print("Background message received: ${message.messageId}");
  // Burada arka planda gelen bildirimi işleyebilirsiniz
}
