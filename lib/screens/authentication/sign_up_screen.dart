import 'package:education_app/blocs/sign_up_bloc/sign_up_event.dart';
import 'package:education_app/blocs/sign_up_bloc/sign_up_state.dart';
import 'package:education_app/models/user/user_model.dart';
import 'package:education_app/widgets/custom_action_button.dart';
import 'package:education_app/widgets/custom_connection_button.dart';
import 'package:education_app/widgets/custom_divider.dart';
import 'package:education_app/widgets/custom_text_form_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../blocs/sign_up_bloc/sign_up_bloc.dart';
import '../../constants/strings/value_regexes.dart';
import '../../widgets/background_container.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _titleController = TextEditingController();

  bool _obscurePassword = true;
  IconData _iconPassword = CupertinoIcons.eye_fill;
  bool _signUpRequired = false;

  bool containsUpperCase = false;
  bool containsLowerCase = false;
  bool containsNumber = false;
  bool containsSpecialChar = false;
  bool contains8Length = false;

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpBloc, SignUpState>(
      listener: (context, state) {
        if (state is SignUpSuccess) {
          setState(() {
            _signUpRequired = false;
            Navigator.pop(context);
          });
        } else if (state is SignUpProcess) {
          setState(() {
            _signUpRequired = true;
          });
        } else if (state is SignUpFailure) {
          return;
        }
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: BackgroundContainer(
            childWidget: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8.0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/education_app_white_logo.png',
                    width: 150,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  const Text(
                    'Kayıt Ol!',
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
                          height: 10,
                        ),
                        //FirstName Field
                        CustomTextFormField(
                          textInputType: TextInputType.name,
                          controller: _firstNameController,
                          hintText: 'İsim',
                          iconData: FontAwesomeIcons.solidUser,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Lütfen alanı doldurunuz.';
                            }
                            return null;
                          },
                        ),

                        //LastName Field
                        CustomTextFormField(
                          textInputType: TextInputType.name,
                          controller: _lastNameController,
                          hintText: 'Soy İsim',
                          iconData: FontAwesomeIcons.solidUser,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Lütfen alanı doldurunuz.';
                            }
                          },
                        ),

                        //Email Field
                        CustomTextFormField(
                            textInputType: TextInputType.emailAddress,
                            controller: _emailController,
                            hintText: 'Email',
                            iconData: FontAwesomeIcons.solidEnvelope,
                            validator: (val) {
                              if (val!.isEmpty) {
                                return 'Lütfen alanı doldurunuz.';
                              } else if (!emailRexExp.hasMatch(val)) {
                                return 'Lütfen geçerli bir email giriniz.';
                              }
                              return null;
                            }),

                        //Password field
                        CustomTextFormField(
                          textInputType: TextInputType.visiblePassword,
                          isObscure: _obscurePassword,
                          controller: _passwordController,
                          hintText: 'Şifre',
                          iconData: FontAwesomeIcons.lock,
                          suffixIcon: IconButton(
                            color: Colors.white,
                            onPressed: () {
                              setState(() {
                                _obscurePassword = !_obscurePassword;
                                if (_obscurePassword) {
                                  _iconPassword = CupertinoIcons.eye_fill;
                                } else {
                                  _iconPassword = CupertinoIcons.eye_slash_fill;
                                }
                              });
                            },
                            icon: Icon(_iconPassword),
                          ),
                          onChanged: (val) {
                            if (val!.contains(RegExp(r'[A-Z]'))) {
                              setState(() {
                                containsUpperCase = true;
                              });
                            } else {
                              setState(() {
                                containsUpperCase = false;
                              });
                            }
                            if (val.contains(RegExp(r'[a-z]'))) {
                              setState(() {
                                containsLowerCase = true;
                              });
                            } else {
                              setState(() {
                                containsLowerCase = false;
                              });
                            }
                            if (val.contains(RegExp(r'[0-9]'))) {
                              setState(() {
                                containsNumber = true;
                              });
                            } else {
                              setState(() {
                                containsNumber = false;
                              });
                            }
                            if (val.contains(specialCharRexExp)) {
                              setState(() {
                                containsSpecialChar = true;
                              });
                            } else {
                              setState(() {
                                containsSpecialChar = false;
                              });
                            }
                            if (val.length >= 8) {
                              setState(() {
                                contains8Length = true;
                              });
                            } else {
                              setState(() {
                                contains8Length = false;
                              });
                            }
                            return null;
                          },
                          validator: (val) {
                            if (val!.isEmpty) {
                              return 'Lütfen alanı doldurunuz.';
                            } else if (!passwordRexExp.hasMatch(val)) {
                              return 'Lütfen geçerli bir şifre giriniz.';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "⚈  1 Büyük harf",
                                      style: TextStyle(
                                          color: containsUpperCase
                                              ? Colors.green
                                              : Colors.white),
                                    ),
                                    Text(
                                      "⚈  1 Küçük harf",
                                      style: TextStyle(
                                          color: containsLowerCase
                                              ? Colors.green
                                              : Colors.white),
                                    ),
                                    Text(
                                      "⚈  1 Sayı",
                                      style: TextStyle(
                                          color: containsNumber
                                              ? Colors.green
                                              : Colors.white),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  width: 10.0,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "⚈  1 Özel karakter",
                                      style: TextStyle(
                                          color: containsSpecialChar
                                              ? Colors.green
                                              : Colors.white),
                                    ),
                                    Text(
                                      "⚈  8 Minimum karakter",
                                      style: TextStyle(
                                          color: contains8Length
                                              ? Colors.green
                                              : Colors.white),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02),
                        !_signUpRequired
                            ? CustomActionButton(
                                function: () {
                                  if (_formKey.currentState!.validate()) {
                                    UserModel userModel = UserModel.empty;
                                    userModel = userModel.copyWith(
                                      email: _emailController.text,
                                      firstName: _firstNameController.text,
                                      lastName: _lastNameController.text,
                                      fullName:
                                          '${_firstNameController.text} ${_lastNameController.text}',
                                    );

                                    setState(() {
                                      context.read<SignUpBloc>().add(
                                            SignUp(
                                              user: userModel,
                                              password:
                                                  _passwordController.text,
                                            ),
                                          );
                                    });
                                  }
                                },
                                buttonText: 'Kayıt Ol',
                              )
                            : const CircularProgressIndicator(
                                color: Colors.white,
                              ),
                      ],
                    ),
                  ),
                  const CustomDivider(dividerText: 'ya da'),
                  const Row(
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
