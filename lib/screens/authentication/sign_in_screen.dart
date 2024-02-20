import 'package:education_app/blocs/sign_in_bloc/sign_in_bloc.dart';
import 'package:education_app/blocs/sign_in_bloc/sign_in_event.dart';
import 'package:education_app/blocs/sign_in_bloc/sign_in_state.dart';
import 'package:education_app/constants/strings/value_regexes.dart';
import 'package:education_app/theme/theme_constants.dart';
import 'package:education_app/widgets/form_input_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
          });
        }

        if (state is SignInFailure) {
          setState(() {
            _isSigned = false;
          });
        }
      },
      child: Scaffold(
        body: SafeArea(
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
                    height: 50.0,
                  ),
                  const Text(
                    'Hoşgeldin!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                    ),
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        //Email field
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 25.0),
                          child: TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            controller: _emailController,
                            style: const TextStyle(color: Colors.white),
                            decoration: kTextFormFieldDecoration.copyWith(
                              hintText: 'Email',
                              prefixIcon: const Align(
                                widthFactor: 1.0,
                                heightFactor: 1.0,
                                child: Icon(
                                  Icons.mail,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Lütfen alanı doldurunuz.';
                              } else if (!emailRexExp.hasMatch(value)) {
                                return 'Lütfen geçerli bir email giriniz.';
                              }
                              return null;
                            },
                          ),
                        ),
                        //Password field
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 25.0),
                          child: TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            controller: _passwordController,
                            obscureText: _isObscure,
                            style: const TextStyle(color: Colors.white),
                            decoration: kTextFormFieldDecoration.copyWith(
                              hintText: 'Şifre',
                              prefixIcon: const Align(
                                widthFactor: 1.0,
                                heightFactor: 1.0,
                                child: Icon(
                                  Icons.lock,
                                  color: Colors.white,
                                ),
                              ),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _isObscure = !_isObscure;
                                  });
                                },
                                icon: _isObscure
                                    ? const Icon(
                                  CupertinoIcons.eye_fill,
                                  color: Colors.white,
                                )
                                    : const Icon(
                                  CupertinoIcons.eye_slash_fill,
                                ),
                              ),
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
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        !_isSigned
                            ? ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              fixedSize: const Size(200.0, 25.0),
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              )),
                          onPressed: () {
                            context.read<SignInBloc>().add(
                              SignInWithMail(
                                  email: _emailController.text,
                                  password: _passwordController.text),
                            );
                          },
                          child: const Text(
                            'Giriş Yap',
                            style: TextStyle(
                              color: Color(0xFF1D3566),
                            ),
                          ),
                        )
                            : const CircularProgressIndicator(),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    //Divider ya da
                    child: Row(
                      children: [
                        Expanded(
                          child: Divider(thickness: 1),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            'ya da',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            thickness: 1,
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: IconButton(
                              onPressed: () {},
                              icon: const Icon(FontAwesomeIcons.google, size: 40.0),
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 30.0,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: IconButton(
                              onPressed: () {},
                              icon: const Icon(FontAwesomeIcons.apple, size: 40.0,),
                              color: Colors.white,
                            ),
                          ),
                        ),
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
