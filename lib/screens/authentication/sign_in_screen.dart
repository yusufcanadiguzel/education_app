import 'package:education_app/blocs/sign_in_bloc/sign_in_bloc.dart';
import 'package:education_app/blocs/sign_in_bloc/sign_in_event.dart';
import 'package:education_app/blocs/sign_in_bloc/sign_in_state.dart';
import 'package:education_app/constants/strings/value_regexes.dart';
import 'package:education_app/screens/authentication/sign_up_screen.dart';
import 'package:education_app/theme/text_styles.dart';
import 'package:education_app/widgets/custom_action_button.dart';
import 'package:education_app/widgets/custom_connection_button.dart';
import 'package:education_app/widgets/custom_divider.dart';
import 'package:education_app/widgets/custom_text_form_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../blocs/auth_bloc/auth_bloc.dart';
import '../../blocs/sign_up_bloc/sign_up_bloc.dart';
import '../../widgets/background_container.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _isSigned = false;
  bool _isObscure = true;
  IconData _iconPassword = CupertinoIcons.eye_fill;

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignInBloc, SignInState>(
      listener: (context, state) {
        if (state is SignInProcess) {
          setState(() {
            _isSigned = false;
          });
        }

        if (state is SignInSuccess) {
          setState(() {
            _isSigned = true;
            Navigator.pop(context);
          });
        }

        if (state is SignInFailure) {
          setState(() {
            _isSigned = false;
          });
        }
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: BackgroundContainer(
            childWidget: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/education_app_white_logo.png',
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  const Divider(height: 0.5, indent: 100.0, endIndent: 100.0),
                  const SizedBox(
                    height: 10.0,
                  ),
                  const Text(
                    'Hoşgeldin!',
                    style: TextStyles.kListTileHeaderTextStyle,
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),

                        //Email field
                        CustomTextFormField(
                          textInputType: TextInputType.emailAddress,
                          controller: _emailController,
                          hintText: 'Email',
                          iconData: Icons.mail,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Lütfen alanı doldurunuz.';
                            } else if (!emailRexExp.hasMatch(value)) {
                              return 'Lütfen geçerli bir email giriniz.';
                            }
                            return null;
                          },
                        ),

                        //Password field
                        CustomTextFormField(
                          textInputType: TextInputType.visiblePassword,
                          maxLines: 1,
                          isObscure: _isObscure,
                          controller: _passwordController,
                          hintText: 'Şifre',
                          iconData: Icons.lock,
                          suffixIcon: IconButton(
                            color: Colors.white,
                            onPressed: () {
                              setState(() {
                                _isObscure = !_isObscure;
                                if (_isObscure) {
                                  _iconPassword = CupertinoIcons.eye_fill;
                                } else {
                                  _iconPassword = CupertinoIcons.eye_slash_fill;
                                }
                              });
                            },
                            icon: Icon(_iconPassword),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Lütfen alanı doldurunuz.';
                            } else if (!passwordRexExp.hasMatch(value)) {
                              return 'Lütfen geçerli bir email giriniz.';
                            }
                            return null;
                          },
                        ),

                        const SizedBox(
                          height: 20,
                        ),
                        !_isSigned
                            ? CustomActionButton(
                                function: () {
                                  if (_formKey.currentState!.validate()) {
                                    context.read<SignInBloc>().add(
                                          SignInWithMail(
                                              email: _emailController.text,
                                              password:
                                                  _passwordController.text),
                                        );
                                  }
                                },
                                buttonText: 'Giriş Yap')
                            : const CircularProgressIndicator(
                                color: Colors.white,
                              ),
                      ],
                    ),
                  ),

                  //Divider
                  const CustomDivider(dividerText: 'ya da'),

                  //Connection Buttons
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomConnectionButton(
                          iconData: FontAwesomeIcons.google,
                        ),
                        SizedBox(
                          width: 30.0,
                        ),
                        CustomConnectionButton(
                          iconData: FontAwesomeIcons.apple,
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 50.0,),

                  TextButton(
                    onPressed: () => Navigator.push(
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
                    ),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Hesabın yok mu?', style: TextStyles.kNormalTextStyle,),
                        SizedBox(width: 10.0,),
                        Text('Kayıt Ol!', style: TextStyles.kHeaderTextStyle,),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
