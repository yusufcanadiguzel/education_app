import 'package:education_app/blocs/sign_in_bloc/sign_in_bloc.dart';
import 'package:education_app/blocs/sign_in_bloc/sign_in_event.dart';
import 'package:education_app/blocs/sign_in_bloc/sign_in_state.dart';
import 'package:education_app/constants/strings/value_regexes.dart';
import 'package:education_app/theme/theme_constants.dart';
import 'package:education_app/widgets/form_input_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            //Email field
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: _emailController,
                decoration: kTextFormFieldDecoration.copyWith(
                  hintText: 'Email',
                  prefixIcon: const Align(
                    widthFactor: 1.0,
                    heightFactor: 1.0,
                    child: Icon(Icons.mail),
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
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: _passwordController,
                obscureText: _isObscure,
                decoration: kTextFormFieldDecoration.copyWith(
                  hintText: 'Şifre',
                  prefixIcon: const Align(
                    widthFactor: 1.0,
                    heightFactor: 1.0,
                    child: Icon(Icons.lock),
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _isObscure = !_isObscure;
                      });
                    },
                    icon: _isObscure
                        ? const Icon(CupertinoIcons.eye_fill)
                        : const Icon(CupertinoIcons.eye_slash_fill),
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
                    onPressed: () {
                      context.read<SignInBloc>().add(
                            SignIn(
                                email: _emailController.text,
                                password: _passwordController.text),
                          );
                    },
                    child: const Text('Giriş Yap'),
                  )
                : const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
