import 'package:education_app/blocs/auth_bloc/auth_bloc.dart';
import 'package:education_app/blocs/sign_in_bloc/sign_in_bloc.dart';
import 'package:education_app/screens/authentication/sign_in_screen.dart';
import 'package:education_app/screens/authentication/sign_up_screen.dart';
import 'package:education_app/widgets/background_container.dart';
import 'package:education_app/widgets/custom_action_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../blocs/sign_up_bloc/sign_up_bloc.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      initialIndex: 0,
      length: 2,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundContainer(
        childWidget: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset('assets/images/education_app_white_logo.png'),
                const SizedBox(
                  height: 20.0,
                ),
                const Text(
                  'Öğren, Paylaş ve Haberleş',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //Giriş Yap Button
                    CustomActionButton(
                      function: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BlocProvider<SignInBloc>(
                              create: (context) => SignInBloc(
                                userRepository: context
                                    .read<AuthenticationBloc>()
                                    .userRepository,
                              ),
                              child: const SignInScreen(),
                            ),
                          ),
                        );
                      },
                      buttonText: 'Giriş Yap',
                      width: 150.0,
                    ),
                    const SizedBox(
                      width: 20.0,
                    ),
                    //Kayıt Ol Button
                    CustomActionButton(
                        function: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BlocProvider<SignUpBloc>(
                                create: (context) => SignUpBloc(
                                  userRepository: context
                                      .read<AuthenticationBloc>()
                                      .userRepository,
                                ),
                                child: const SignUpScreen(),
                              ),
                            ),
                          );
                        },
                        buttonText: 'Kayıt Ol',
                        width: 150.0),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
